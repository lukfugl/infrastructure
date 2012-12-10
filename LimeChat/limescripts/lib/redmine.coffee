##
# converts channel spans to redmine links, limechat thinks text
# that starts with # should link to the channel, but its wrong
bind 'channel', ->
  html = this.innerHTML
  return unless html.match /^#\d+$/
  id = html.replace /^#/, ''
  html = "<a href='https://redmine.instructure.com/issues/#{id}'>##{id}</a>"
  this.setAttribute 'oncontextmenu', '' # clear default behavior
  this.innerHTML = html
