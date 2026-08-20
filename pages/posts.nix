{
  templates,
  slib,
  lib,
  data,
  ...
}:
{
  index = templates.base "yunfachi blog posts" ''
    <p>This is my blog, mostly about weird things built with Nix and security vulnerabilities that I can publicly disclose.</p>

    ${lib.concatMapStringsSep "" (post: ''
      <p>${slib.anchor "/posts/${post.name}" "[${post.value.date}] ${post.value.title}"}</p>
    '') (builtins.sort (a: b: a.value.date > b.value.date) (lib.attrsToList data.posts))}
  '';
}
// lib.mapAttrs (_id: post: {
  index = templates.base post.title ''
    <p>${post.title} - ${post.date}<br>${slib.anchor "/posts" "[back to posts]"} ${slib.anchor post.editURL "[edit]"}</p>
    ${templates.frame "POST CONTENT" "<pre>${post.content}</pre>"}
  '';
}) data.posts
