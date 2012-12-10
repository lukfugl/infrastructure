bind 'time', ->
  prev = this.parentNode.previousSibling.firstChild
  if this.innerHTML == prev.innerHTML
    this.className += " duptime"
