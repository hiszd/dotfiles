{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      libevdev
      nodejs_latest
      nodePackages_latest.npm
      nodePackages_latest.typescript-language-server
    ];
    # buildInputs = with pkgs; [
    # ];

    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
    '';
}
