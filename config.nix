{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      baseDev = base // {
        inherit ghc basePrelude cabalInstall cabal2nix;
      };
      toolDev = baseDev // {
        inherit ghcMod hoogle hlint SourceGraph codex hasktags;
      };
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
