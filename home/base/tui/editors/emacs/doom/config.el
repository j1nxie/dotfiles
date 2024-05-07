;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-symbol-font (font-spec :family "Symbols Nerd Font" :size 12))
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq auto-dark-dark-theme 'catppuccin)
(setq auto-dark-light-theme 'catppuccin)

(add-hook 'auto-dark-dark-mode-hook
          (lambda ()
            (setq catppuccin-flavor 'macchiato)
            (catppuccin-reload)))

(add-hook 'auto-dark-light-mode-hook
          (lambda ()
            (setq catppuccin-flavor 'latte)
            (catppuccin-reload)))

(add-hook 'server-after-make-frame-hook #'catppuccin-reload)

(auto-dark-mode 1)

;; emulating my neovim keybinds
(map! :nvo "H" #'evil-beginning-of-visual-line
      :nvo "L" #'evil-end-of-visual-line
      :nvo "k" #'evil-previous-visual-line
      :nvo "j" #'evil-next-visual-line)

(map! "C-h" #'evil-window-left
      "C-j" #'evil-window-down
      "C-k" #'evil-window-up
      "C-l" #'evil-window-right)

;; override ccls binds to maintain above binds because i don't use ccls
(after! ccls
  (map! :after ccls
        :map (c-mode-map c++-mode-map)
        :n "C-h" #'evil-window-left
        :n "C-j" #'evil-window-down
        :n "C-k" #'evil-window-up
        :n "C-l" #'evil-window-right))

(map! "<f5>" #'treemacs-select-window)

(map! :nv "C-/" #'comment-line)

(map! :nv "<left>" #'previous-buffer
      :nv "<right>" #'next-buffer)

(map! [remap evil-quit] #'kill-current-buffer)

(setq fancy-splash-image (concat doom-user-dir "marivector.png"))

(defun elcord--disable-elcord-if-no-frames (f)
  (when (let ((frames (delete f (visible-frame-list))))
          (or (null frames)
              (and (null (cdr frames))
                   (eq (car frames) terminal-frame))))
    (elcord-mode -1)
    (add-hook 'after-make-frame-functions 'elcord--enable-on-frame-created)))

(defun elcord--enable-on-frame-created (_)
  (elcord-mode +1))

(defun my/elcord-mode-hook ()
  (if elcord-mode
      (add-hook 'delete-frame-functions 'elcord--disable-elcord-if-no-frames)
    (remove-hook 'delete-frame-functions 'elcord--disable-elcord-if-no-frames)))

(add-hook 'elcord-mode-hook 'my/elcord-mode-hook)

(require 'elcord)
(elcord-mode)

;; FIXME: change the icon for discord rpc
(after! elcord
  (setq elcord-idle-message "falling asleep...")
  (setq elcord-use-major-mode-as-main-icon 't))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; treemacs
(after! treemacs
  (setq treemacs-select-when-already-in-treemacs 'close))

;; :lang cc to use clangd
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; don't launch a new workspace every launch
(after! persp-mode (setq persp-emacsclient-init-frame-behaviour-override "main"))

(after! lsp-mode (setq lsp-rust-analyzer-cargo-watch-command "clippy"))
