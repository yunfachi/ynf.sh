{
  lib,
  pages,
  slib,
  ...
}:
''
  <p class="nav">${
    lib.concatMapStringsSep " " (
      name: slib.anchor "/${lib.optionalString (name != "index") name}" "[${name}]"
    ) (builtins.attrNames pages)
  }</p>
''
