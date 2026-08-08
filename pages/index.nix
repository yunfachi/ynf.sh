{ templates, slib, ... }:
templates.base "yunfachi website" ''
  <p>Hello! This is my purely ${slib.anchorNewTab "https://github.com/yunfachi/ynf.sh" "Nix-built site"} with no JavaSlop.</p>

  <p>You can find some of my work here: <span class="nowrap">${slib.anchorNewTab "https://github.com/yunfachi" "://github.com/yunfachi"}</span>.<br>
  Or contact me by electronic mail: <span class="nowrap">contact [at] ynf [dot] sh</span>.</p>
''
