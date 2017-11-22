function poll() {
  $.getJSON('/tree.json', function(response){
    draw(response);
  })
}

setInterval(poll, 1000)
