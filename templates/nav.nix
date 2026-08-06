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
    ) ["index" "projects"]
  }</p>
''
