{
  templates,
  ...
}:
title: content: ''
  <!DOCTYPE html>
  <html>
  <head>${templates.head title}</head>
  <body>${templates.layout content}</body>
  </html>
''
