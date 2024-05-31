{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell (with pkgs; {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [
      pkg-config
      openssl
      libevdev
      postgresql
      nodejs_22
      nodePackages_latest.typescript-language-server
      nodePackages_latest.prisma
      bun
      esbuild
      sqls
    ];
    # buildInputs = with pkgs; [
    # ];

    shellHook = ''
      export XDG_RUNTIME_DIR=/run/user/$(id -u)
      export PATH="$PWD/node_modules/.bin:$PATH"
    '';

    PRISMA_SCHEMA_ENGINE_BINARY = "${prisma-engines}/bin/schema-engine";
	  PRISMA_QUERY_ENGINE_BINARY = "${prisma-engines}/bin/query-engine";
	  PRISMA_QUERY_ENGINE_LIBRARY = "${prisma-engines}/lib/libquery_engine.node";
	  PRISMA_INTROSPECTION_ENGINE_BINARY = "${prisma-engines}/bin/introspection-engine";
	  PRISMA_FMT_BINARY = "${prisma-engines}/bin/prisma-fmt";
})
