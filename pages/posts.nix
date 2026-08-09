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

    ${lib.concatMapAttrsStringSep "" (id: post: ''
      <p>${slib.anchor "/posts/${id}" "[${post.date}] ${post.title}"}</p>
    '') data.posts}
  '';
}
// lib.mapAttrs (_id: post: {
  index = templates.base post.title ''
    <p>${post.title} - ${post.date}<br>${slib.anchor "/posts" "[back to posts]"} ${slib.anchor (slib.getRemoteAttrPos post "content") "[edit]"}</p>
    ${templates.frame "POST CONTENT" "<pre>${
      lib.replaceStrings [ " - " ] [ " — " ] post.content
    }</pre>"}
  '';
}) data.posts
