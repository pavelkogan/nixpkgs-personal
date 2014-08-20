{
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    base = { inherit (pkgs) nix; };
    haskellPackages = with pkgs.haskellPackages; pkgs.haskellPackages // rec {
      basePkgs = [
        basePrelude
        basicPrelude
        prettyShow
        shelly
      ];
      shPkgs = [
        aeson
        haddock
        haskellSrcExts
      ];
      nsPkgs = [
        conduit
        dataDefaultGenerics
        fgl
        graphviz
        gtk
        mtl
        parsec
        reactiveBanana
        reactiveBananaGtk
        safe
        strict
        text
        transformers
        webkit
        xmlConduit
        xmlConduitWriter
        xmlTypes
      ];
      nsEnv = ghcWithPackagesOld (self: basePkgs ++ nsPkgs ++ shPkgs );
      baseDev = base // {
        inherit
          cabal2nix
          cabalInstall
      ;};
      toolDev = baseDev // {
        inherit
          codex
          ghcMod
          hasktags
          hscolour
          hlint
          hoogle
          SourceGraph
      ;};
      nsDev = toolDev // {
        inherit nsEnv;
        graphvizBin = pkgs.graphviz;
      };
      dataDefaultGenerics = callPackage ./haskell/data-default-generics.nix {};
      reactiveBananaGtk = callPackage ./haskell/reactive-banana-gtk.nix {};
    };
  };
}
