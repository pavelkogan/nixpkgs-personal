{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      basePkgs = [ basePrelude shelly basicPrelude ];
      nsEnv = ghcWithPackages (self: basePkgs ++ [
        conduit dataDefaultGenerics fgl graphviz gtk mtl parsec reactiveBanana
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
      dataDefaultGenerics = callPackage ./haskell/data-default-generics.nix {};
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
