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
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
