parseAlert = (alert) ->
  regex = /^(.*) on (.*)$/
  matches = alert.match regex
  if matches
    return [ matches[1], matches[2] ]
  return [ alert, null ]

bind 'line', (line) ->
  message = $(line).find '.message'
  regex = /•\s+(PROBLEM|OK)\s+•\s+(.*?)\s+•\s+Current Value\s+•\s+(.*)/
  matches = message.text().match regex
  return unless matches

  type = matches[1]
  alert = matches[2]
  value = matches[3]

  message.html ""
  message.addClass 'zabbix'
  message.addClass (type == 'OK' && 'zabbix-ok' || 'zabbix-problem')

  [ alert, host ] = parseAlert(alert)
  if host
    span = $("<span class='hostname'>#{host}</span>")
    span.appendTo message

  message.append $("<span class='value'>#{value}</span>")
  message.append $("<span class='alert'>#{alert}</span>")
