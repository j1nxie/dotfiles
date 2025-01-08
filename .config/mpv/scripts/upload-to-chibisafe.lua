local utils = require "mp.utils"
local msg = require "mp.msg"
local options = require "mp.options"

local function get_platform_info()
    local os_name = ""
    local clipboard_cmd = ""

    local uname = io.popen("uname -s 2>/dev/null")
    if uname then
        os_name = uname:read("*l") or ""
        uname:close()
    end

    local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil

    if os_name == "Linux" then
        if is_wayland then
            clipboard_cmd = "wl-copy"
        else
            clipboard_cmd = "xclip -selection clipboard"
        end
    elseif os_name == "Darwin" then
        clipboard_cmd = "pbcopy"
    else
        clipboard_cmd = "clip"
    end

    return {
        os = os_name,
        is_wayland = is_wayland,
        clipboard_cmd = clipboard_cmd
    }
end

local platform = get_platform_info()
local config = {
    chibisafe_url = "",
    api_key = "",
    copy_command = platform.clipboard_cmd
}

options.read_options(config, "chibisafe")

if config.chibisafe_url == "" or config.api_key == "" then
    msg.error("Chibisafe configuration incomplete.")
    msg.error("Please set chibisafe_url and api_key in ~/.config/mpv/script-opts/chibisafe.conf")
    return
end

local function upload_to_chibisafe(path)
    local curl_cmd = {
        "curl",
        "-X", "POST",
        "-H", "x-api-key: " .. config.api_key,
        "-F", "file=@\"" .. path .. "\"",
        config.chibisafe_url
    }

    local result = utils.subprocess({
        args = curl_cmd,
        capture_stdout = true,
        capture_stderr = true
    })

    if result.status == 0 then
        msg.error(result.stdout)
        local response = utils.parse_json(result.stdout)
        if response and response.url then
            local pipe = io.popen(string.format('echo -n "%s" | %s', response.url, config.copy_command), "w")
            pipe:close()

            msg.info("Screenshot uploaded: " .. response.url)
            mp.osd_message("Screenshot uploaded and URL copied to clipboard")
        else
            msg.error("Failed to parse upload response")
            mp.osd_message("Failed to upload screenshot")
        end
    else
        msg.error("Upload failed: " .. (result.stderr or "unknown error"))
        mp.osd_message("Failed to upload screenshot")
    end
end

local function handle_screenshot()
    mp.command_native_async({"screenshot"}, function(success, result, error)
        if success then
            mp.add_timeout(0.1, function()
                upload_to_chibisafe(result.filename)
            end)
        else
            msg.error("Failed to take screenshot: " .. (error or "unknown error"))
            mp.osd_message("Failed to take screenshot")
        end
    end)
end

mp.add_forced_key_binding("s", "upload-screenshot", handle_screenshot)
