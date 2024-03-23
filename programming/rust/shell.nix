{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      libevdev
      rustup
      postgresql
      llvmPackages.clangUseLLVM
      llvmPackages.libllvm
      llvmPackages.libclang
      cmake
    ];
    buildInputs = with pkgs; [
      libpqxx
      systemd
      stdenv.cc.libc
    ];

    # why do we need to set the library path manually?
    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
      export LIBCLANG_PATH="${pkgs.llvmPackages.libclang.lib}/lib";
      export XDG_RUNTIME_DIR="/run/user/$(id -u)";
    '';
}
