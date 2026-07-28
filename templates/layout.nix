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

  <div class="logo"></div>
''
