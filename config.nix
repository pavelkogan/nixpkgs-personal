{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      basePkgs = [ basePrelude shelly ];
      nsEnv = ghcWithPackages (self: basePkgs ++ [
        conduit dataDefault fgl graphviz gtk mtl parsec reactiveBanana
        reactiveBananaGtk safe strict text transformers webkit xmlConduit
        xmlConduitWriter xmlTypes
      ]);
      baseDev = base // {
        inherit cabalInstall cabal2nix;
      };
      toolDev = baseDev // {
        inherit ghcMod hoogle hlint SourceGraph codex hasktags hscolour;
      };
      nsDev = toolDev // {
        inherit nsEnv;
        graphvizBin = pkgs.graphviz;
      };
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
