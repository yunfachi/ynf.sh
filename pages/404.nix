{ templates, slib, ... }:
let
  k = txt: ''<span class="k">${txt}</span>'';
  l = txt: ''<span class="l">${txt}</span>'';
in
templates.base "yunfachi website - 404" ''
  <p>Something went wrong. ${slib.anchor "/" "Click here"} to continue.</p>

  <pre class="chroma">
  ${k "error"}:
    … while evaluating the attribute ${l "'config'"}
      at ${l "/nix/store/qbl1kr98npbip2bkb0xsv0255dd3jraw-source/lib/modules.nix"}:${l "402"}:${l "9"}:
       ${k "404"}|         options = checked options;
       ${k "404"}|         config = checked (removeAttrs config [ "_module" ]);
          |         ^
       ${k "404"}|         _module = checked (config._module);

    … while calling the ${l "'seq'"} builtin
      at ${l "/nix/store/qbl1kr98npbip2bkb0xsv0255dd3jraw-source/lib/modules.nix"}:${l "402"}:${l "18"}:
       ${k "404"}|         options = checked options;
       ${k "404"}|         config = checked (removeAttrs config [ "_module" ]);
          |                  ^
       ${k "404"}|         _module = checked (config._module);

    … while evaluating the option ${l "`_module.freeformType`"}:

    … while evaluating the module argument ${l "`config`"} in ${l ''"k."''}:

    … if you get an infinite recursion here, you probably reference ${l "`config`"} in ${l "`imports`"}. If you are trying to achieve a conditional import behavior dependent on ${l "`config`"}, consider touching grass, and using ${l "`mkEnableOption`"} and ${l "`mkIf`"} to control its effect.

    (stack trace truncated; use ${l "'--show-trace'"} to show an even more unhelpful trace)

    ${k "error"}: infinite recursion encountered
  </pre>
''
