{
  templates,
  lib,
  slib,
  ...
}:
templates.base ''
  <p>My projects:</p>

  <pre>
  ${lib.concatMapStringsSep "\n"
    (project: ''
      ${project.name} :: '[${lib.concatStringsSep ", " project.languages}] =
      { ${lib.concatStringsSep "\n, " (
          (lib.optional (
            project ? description
          ) "description = ${lib.strings.escapeNixString project.description}")
          ++ (lib.optional (project ? source) "source = ${slib.styledAnchor project.source}")
          ++ (lib.optional (project ? docs) "docs = ${slib.styledAnchor project.docs}")
        )} }
    '')
    [
      # {
      #   name = "nix-secrets";
      #   languages = [
      #     "Nix"
      #     "Rust"
      #   ];
      #   description = "A postmodern secrets manager for NixOS";
      #   source = "https://github.com/unnamed-systems/nix-secrets";
      #   docs = "https://nix-secrets.unnamed.systems/";
      # }
      {
        name = "denix";
        languages = [ "Nix" ];
        description = "Extensible Nix library for creating scalable NixOS, Home Manager, and Nix-Darwin configurations with modules, hosts, and rices";
        source = "https://github.com/yunfachi/denix";
        docs = "https://denix.ynf.sh/";
      }
      {
        name = "nixsecauditor";
        languages = [ "Nix" ];
        description = "Extensible rule-based static security auditor for NixOS configurations with multiple reporting outputs";
        source = "https://github.com/unnamed-systems/nixsecauditor";
      }
      {
        name = "nix-osu";
        languages = [ "Nix" ];
        description = "Declarative configuration of osu!";
        source = "https://github.com/yunfachi/nix-osu";
        docs = "https://nix-osu.ynf.sh/";
      }
      {
        name = "NixOwOS";
        languages = [ "Nix" ];
        description = "Complete redesign of NixOS into real m-man distwibution, featuring updated logos, renamed distro, and more";
        source = "https://github.com/yunfachi/nixowos";
        docs = "https://nixowos.ynf.sh/";
      }
      {
        name = "wallpaper-manager";
        languages = [ "Rust" ];
        description = "Daemon for unified interaction with wallpaper daemons";
        source = "https://github.com/unnamed-systems/wallpaper-manager";
      }
    ]
  }
  }</pre>
''
