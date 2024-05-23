{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs; [
    elixir
    elixir-ls
    nodePackages.typescript-language-server
    ];
    buildInputs = with pkgs; [
    ];

    shellHook = ''
      export XDG_RUNTIME_DIR="/run/user/$(id -u)";
    '';
}
