{
  lib,
  myvars,
  ...
}: {
  services.openssh.enable = true;
  environment.enableAllTerminfo = true;
}
