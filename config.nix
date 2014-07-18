{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
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
      neuroSpider = callPackage ./haskell/neuro-spider.nix {
        inherit reactiveBananaGtk xmlConduitWriter webkit;
      };
    };
  };
}
