{
  pkgs,
  lib,
  slib,
  flake,
  ...
}@args:
{
  call = file: lib.toFunction (import file) args;

  callDir =
    dir:
    lib.genAttrs' (builtins.attrNames (builtins.readDir dir)) (name: {
      name = lib.removeSuffix ".nix" name;
      value = slib.call (dir + "/${name}");
    });

  addSuffixToAttrNames =
    suffix: attrs: lib.mapAttrs' (name: lib.nameValuePair "${name}${suffix}") attrs;

  addSuffixToAttrNamesRecursive =
    suffix:
    let
      func = lib.mapAttrs' (
        name: value:
        if builtins.isAttrs value then
          {
            inherit name;
            value = func value;
          }
        else
          lib.nameValuePair "${name}${suffix}" value
      );
    in
    func;

  getRemoteAttrPos =
    attrs: name:
    let
      pos = builtins.unsafeGetAttrPos name attrs;
    in
    "https://github.com/yunfachi/ynf.sh/blob/master${
      lib.removePrefix (flake.outPath or ./.) pos.file
    }#L${toString pos.line}";

  flattenAttrs =
    let
      func =
        prefix: sep: attrs:
        lib.concatMapAttrs (
          name: value:
          let
            path = lib.optionalString (prefix != "") "${prefix}${sep}" + name;
          in
          if builtins.isAttrs value then
            func path value
          else
            {
              "${path}" = value;
            }
        ) attrs;
    in
    func "";

  toDir =
    structure:
    let
      flat = slib.flattenAttrs "/" structure;
    in
    pkgs.linkFarm "site" (
      builtins.mapAttrs (
        name: value: if builtins.isPath value then value else builtins.toFile name value
      ) flat
    );

  escapeHtml = lib.escapeXML;

  anchor = url: content: ''<a href="${slib.escapeHtml url}">${content}</a>'';

  anchorNewTab = url: content: ''<a href="${slib.escapeHtml url}" target="_blank">${content}</a>'';

  styledAnchor = url: slib.anchorNewTab url (lib.removePrefix "https" url);
}
