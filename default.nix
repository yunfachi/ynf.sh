{
  lib ? pkgs.lib,
  pkgs ? import <nixpkgs> { },
  system ? builtins.currentSystem,
  flake ? { },
  ...
}@args:
let
  slib = import ./lib.nix (
    args
    // {
      inherit
        data
        templates
        pages
        slib
        lib
        pkgs
        system
        flake
        ;
    }
  );

  data = slib.callDir ./data;

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
  // slib.addSuffixToAttrNamesRecursive ".html" pages;
in
slib.toDir structure
