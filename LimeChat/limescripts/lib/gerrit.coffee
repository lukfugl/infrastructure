##
# Links gerrit/:id or g/:id to gerrit
bind 'line', (line) ->
  html = line.innerHTML
  regex = /\b(?:gerrit|g)\/(\d+)\b/g
  replacement = "<a href='https://gerrit.instructure.com/#/c/$1'>$&</a>"
  html = html.replace regex, replacement
  line.innerHTML = html
