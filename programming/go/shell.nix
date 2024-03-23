{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      go
      gopls
      postgresql
    ];
    buildInputs = with pkgs; [
      systemd
      stdenv.cc.libc
    ];

    # why do we need to set the library path manually?
    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
    '';
}
