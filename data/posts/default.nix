{ slib, lib, ... }:
lib.mapAttrs (
  id: post:
  post
  // {
    title = lib.replaceStrings [ " - " ] [ " — " ] post.title;
    content = lib.replaceStrings [ " - " ] [ " — " ] post.content;
    editURL = slib.getRemoteAttrPos post "content";
  }
) (slib.callDir ./src)
