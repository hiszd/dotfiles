{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
      pkg-config
      openssl
      rustup
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
      webkitgtk_4_1
      glib
      xdotool
      taplo
    ];
    buildInputs = with pkgs; [
      libpqxx
      systemd
      stdenv.cc.libc
    ];
    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
      libGL
      libxkbcommon
      wayland
      xorg.libX11
      xorg.libXcursor
      xorg.libXi
      xorg.libXrandr
      webkitgtk_4_1.dev
      gtk3.dev
      libappindicator-gtk3
      librsvg
      gdk-pixbuf
      glib.dev
    ];

    # why do we need to set the library path manually?
    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
      export LIBCLANG_PATH="${pkgs.llvmPackages.libclang.lib}/lib";
      export TAPLO_CONFIG=/home/zion/programming/rust/taplo.toml
    '';
}
