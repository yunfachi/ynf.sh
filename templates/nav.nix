{
  lib,
  pages,
  slib,
  ...
}:
''
  <p class="nav">${
    lib.concatMapStringsSep " " (name: slib.anchor "/${name}.html" "[${name}]") (
      builtins.attrNames pages
    )
  }</p>
''
