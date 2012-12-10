##
# finds CNVS-1234 links in messages and links to the jira page
bind 'line', ->
  html = this.innerHTML
  return if html.match /instructure\.atlassian\.net/ or html.match /jira.instructure.com/
  html = html.replace /CNVS-\d+/g , (match) ->
    "<a href='http://jira.instructure.com/browse/#{match}'>#{match}</a>"
  this.innerHTML = html
