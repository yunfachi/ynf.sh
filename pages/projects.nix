{
  templates,
  lib,
  slib,
  data,
  ...
}:
templates.base "yunfachi projects" ''
  <p>My projects:</p>

  <pre>
  ${
    lib.concatMapStringsSep "\n" (project: ''
      ${project.name} :: '[${lib.concatStringsSep ", " project.languages}] = {
        ${lib.concatStringsSep "\n  " (
          (lib.optional (
            project ? description
          ) "description = ${lib.strings.escapeNixString project.description}")
          ++ (lib.optional (project ? source) "source      = ${slib.styledAnchor project.source}")
          ++ (lib.optional (project ? docs) "docs        = ${slib.styledAnchor project.docs}")
        )}
      }
    '') data.projects
  }</pre>
''
