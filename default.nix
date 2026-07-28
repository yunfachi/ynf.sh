{ lib, ... }@args:
let
  slib = import ./lib.nix (args // { inherit templates pages slib; });

  templates = lib.mapAttrs (
    _name: value:
    if !builtins.isFunction value then
      lib.removeSuffix "\n" value
    else
      content: lib.removeSuffix "\n" (value (lib.removeSuffix "\n" content))
  ) (slib.callDir ./templates);
  pages = slib.callDir ./pages;

  structure = {
    "assets" = ./assets;
  }
  // slib.addSuffixToAttrNames ".html" pages;
in
slib.toDir structure
