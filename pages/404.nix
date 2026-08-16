{ templates, slib, ... }:
templates.base "yunfachi website - 404" ''
  <p>Something went wrong. ${slib.anchor "/" "Click here"} to continue.</p>

  <pre>${slib.highlightCode "go" ''
    error:
      … while evaluating the attribute 'config'
        at /nix/store/qbl1kr98npbip2bkb0xsv0255dd3jraw-source/lib/modules.nix:402:9:
         404|         options = checked options;
         404|         config = checked (removeAttrs config [ "_module" ]);
            |         ^
         404|         _module = checked (config._module);

      … while calling the 'seq' builtin
        at /nix/store/qbl1kr98npbip2bkb0xsv0255dd3jraw-source/lib/modules.nix:402:18:
         404|         options = checked options;
         404|         config = checked (removeAttrs config [ "_module" ]);
            |                  ^
         404|         _module = checked (config._module);

      … while evaluating the option `_module.freeformType`:

      … while evaluating the module argument `config` in "k.":

      … if you get an infinite recursion here, you probably reference `config` in `imports`. If you are trying to achieve a conditional import behavior dependent on `config`, consider touching grass, and using `mkEnableOption` and `mkIf` to control its effect.

      (stack trace truncated; use '--show-trace' to show an even more unhelpful trace)

      error: infinite recursion encountered
  ''}</pre>
''
