# ynf.sh

My personal website, built with Nix and no JavaSlop.

Just open it: https://ynf.sh/

<p align="center">
  <a href="https://ynf.sh/"><img src=".github/assets/screenshots/index.png" width="49%"></a>
  <a href="https://ynf.sh/projects"><img src=".github/assets/screenshots/projects.png" width="49%"></a>
  <a href="https://ynf.sh/posts"><img src=".github/assets/screenshots/posts.png" width="49%"></a>
  <a href="https://ynf.sh/posts/nix-secrets-a-postmodern-secrets-manager-for-nixos"><img src=".github/assets/screenshots/post.png" width="49%"></a>
</p>

## Build

```sh
nix build .#site
```

The generated website will be available in `result/`.

## License

The source code is licensed under the GPLv3.
