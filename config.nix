{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      baseDev = base // {
        inherit ghc basePrelude cabalInstall cabal2nix shelly;
      };
      toolDev = baseDev // {
        inherit ghcMod hoogle hlint SourceGraph codex hasktags hsdev;
      };
      nsDev = toolDev // {
        inherit
          conduit dataDefault fgl graphviz gtk mtl parsec reactiveBanana
          reactiveBananaGtk safe strict text transformers webkit xmlConduit
          xmlConduitWriter xmlTypes threepennyGui;
        graphvizBin = pkgs.graphviz;
      };
      codex = callPackage ./haskell/codex.nix {};
      hsdev = callPackage ./haskell/hsdev.nix {
        inherit hdocs;
      };
      hdocs = callPackage ./haskell/hdocs.nix {};
      webkit = callPackage ./haskell/webkit.nix {
        webkit = pkgs.webkitgtk2;
      };
      basePrelude = callPackage ./haskell/base-prelude.nix {};
      Graphalyze = callPackage ./haskell/graphalyze.nix {};
      SourceGraph = callPackage ./haskell/sourcegraph.nix {
        inherit Graphalyze;
        Cabal = Cabal_1_20_0_1;
      };
      xmlConduitWriter = callPackage ./haskell/xml-conduit-writer.nix {};
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
