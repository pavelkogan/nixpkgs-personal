{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      baseDev = base // {
        inherit ghc basePrelude cabalInstall cabal2nix shelly;
      };
      toolDev = baseDev // {
        inherit ghcMod hoogle hlint SourceGraph codex hasktags haddock;
      };
      nsDev = toolDev // {
        inherit
          conduit dataDefault fgl graphviz gtk mtl parsec reactiveBanana
          reactiveBananaGtk safe strict text transformers webkit xmlConduit
          xmlConduitWriter xmlTypes;
        graphvizBin = pkgs.graphviz;
      };
      webkit = callPackage ./haskell/webkit.nix {
        webkit = pkgs.webkitgtk2;
      };
      basePrelude = callPackage ./haskell/base-prelude.nix {};
      Graphalyze = callPackage ./haskell/graphalyze.nix {};
      SourceGraph = callPackage ./haskell/sourcegraph.nix {
        inherit Graphalyze;
      };
      xmlConduitWriter = callPackage ./haskell/xml-conduit-writer.nix {};
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
