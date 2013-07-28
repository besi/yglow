service = null

$ ->
  service = new Service()
  service.hello()
  service.onColorChange = (color)->
    $('#color').css 'background-color', color
    console.log "Change color to #{color}"
