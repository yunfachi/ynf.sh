{
  templates,
  ...
}:
content: ''
  <div class="text">${templates.frame ''
    ${templates.nav}

    ${content}
  ''}

  ${templates.footer}
  </div>

  <img src="/assets/banner.gif" alt="">
''
