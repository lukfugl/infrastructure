bind 'time', ->
  prev = this.parentNode?.previousSibling?.firstChild
  if prev? and this.innerHTML == prev.innerHTML
    this.className += " duptime"
