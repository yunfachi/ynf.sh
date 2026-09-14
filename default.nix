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
    _name:
    let
      func =
        value:
        if !builtins.isFunction value then
          lib.removeSuffix "\n" value
        else
          content: func (value (lib.removeSuffix "\n" content));
    in
    func
  ) (slib.callDir ./templates);

  pages = lib.mapAttrs' (name: value: lib.nameValuePair (lib.removeSuffix "/index" name) value) (
    slib.flattenAttrs "/" (slib.callDir ./pages)
  );

  structure = {
    "assets/banner.png" = ./assets/banner.png;
    "assets/style.css" = ./assets/style.css;
    "assets/theme.css" = ./assets/theme.css;
    "assets/font.ttf" = pkgs.terminus_font_ttf + "/share/fonts/truetype/TerminusTTF-Bold.ttf";
    "assets/font-italic.ttf" = pkgs.terminus_font_ttf + "/share/fonts/truetype/TerminusTTF-Bold-Italic.ttf";
    "sitemap.txt" = lib.concatMapStringsSep "\n" (
      path: lib.removeSuffix "index" "https://ynf.sh/${path}"
    ) (builtins.attrNames pages);
    "robots.txt" = ''
      User-agent: *
      Allow: /

      Sitemap: https://ynf.sh/sitemap.txt
    '';
  }
  // slib.addSuffixToAttrNamesRecursive ".html" pages;
in
slib.toDir structure
