{
  lib,
  system,
  flake,
  slib,
  ...
}:
''
  <p>
  Evaluated with Nix ${builtins.nixVersion} on ${system}
  <br>
  Revision ${
    if flake ? shortRev then
      slib.anchorNewTab "https://github.com/yunfachi/ynf.sh/tree/${flake.rev or flake.shortRev}" flake.shortRev
    else
      "dirty"
  }${
    lib.optionalString (flake.lastModifiedDate or "19700101000000" != "19700101000000")
      " (modified on ${lib.substring 0 4 flake.lastModifiedDate}-${
         lib.substring 4 2 flake.lastModifiedDate
       }-${lib.substring 6 2 flake.lastModifiedDate})"
  }
  </p>
''
