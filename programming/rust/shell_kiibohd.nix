{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      capnproto
      xorg.libX11
      xorg.libXtst
      xorg.libxcb
      libevdev
      llvmPackages.clangUseLLVM
      llvmPackages.libllvm
      llvmPackages.libclang
      cmake
      libxkbcommon
      qt5.full
    ];
    buildInputs = with pkgs; [
      systemd
      stdenv.cc.libc
    ];

    XDG_RUNTIME_DIR="/run/user/$(id -u)";
    # why do we need to set the library path manually?
    shellHook = ''
      export LIBCLANG_PATH="${pkgs.llvmPackages.libclang.lib}/lib";
    '';
}
