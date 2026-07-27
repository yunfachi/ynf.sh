args:
let
  slib = import ./lib.nix (args // { inherit templates pages slib; });

  templates = slib.callDir ./templates;
  pages = slib.callDir ./pages;

  structure = {
    "assets" = ./assets;
  }
  // slib.addSuffixToAttrNames ".html" pages;
in
slib.toDir structure
