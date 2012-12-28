# - fail.png => http://cl.ly/image/183e0Z3L181f
# - pass.png => http://cl.ly/image/233w153f3o2C
images =
  fail: 'http://f.cl.ly/items/3W0B3C1l3u3D0w231y2y/fail.png'
  pass: 'http://f.cl.ly/items/1g153P1F302c1h1F0T0P/pass.png'

bind 'line', (line) ->
  # see if out message matches:
  # gilfus: ● .* Build (Succeeded|FAILED) in x mins ● name ● git status msg ● https://hudson.instructure.com/job/canvas-lms/7283/
  message = $(line).find '.message'
  regex = /● (.+) (?:Build)? (Succeeded|FAILED)\s*(?:\w+:(\d*))?\s*(?:in (\d+) mins)?\s*●\s*(?:(\w+)\s*●)?\s*(?:(.+)\s*●)?\s*(https:.*)\s*●/
  matches = message.text().match regex
  return unless matches

  idx       = 1 # 0 is the whole thing
  buildType = matches[idx++]
  success   = matches[idx++]
  patchset  = matches[idx++]
  time      = matches[idx++]
  user      = matches[idx++]
  gitMsg    = matches[idx++]?.trim()
  hudsonURL = matches[idx++]?.trim()
  icon      = if success == "Succeeded" then "pass" else "fail"

  message.html ""
  image = $ "<img/>",
    src: images[icon]
    class: "build-icon"
  image.appendTo message
  space = $ "<span/>"
  space.append " "
  space.appendTo message
  build = $ "<span/>"
  build.append "#{user} ➜ " if user
  build.appendTo message
  hudson = $ "<a/>",
    href: hudsonURL
  hudson.append(gitMsg or buildType)
  hudson.appendTo message
  whichBuild = $ "<span/>"
  whichBuild.append " [#{buildType}" if gitMsg
  whichBuild.append ":#{patchset}" if patchset
  whichBuild.append "]" if gitMsg
  whichBuild.appendTo message
