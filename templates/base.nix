{
  templates,
  ...
}:
content: ''
  <!DOCTYPE html>
  <html>
  <head>${templates.head}</head>
  <body>${templates.layout content}</body>
  </html>
''
