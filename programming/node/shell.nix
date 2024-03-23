{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      libevdev
      postgresql
      nodejs
      nodePackages_latest.npm
      bun
      esbuild
    ];
    buildInputs = with pkgs; [
      systemd
      stdenv.cc.libc
    ];

    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
    '';
}
