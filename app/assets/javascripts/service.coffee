class window.Service

  @onColorChange = null
  @clientIdentifier = null

  hello: =>

    $.ajaxSetup(dataType: 'json')

    $.get '/api/register/', (data)=>
      #data = $.parseJSON(data)
      @clientIdentifier = data.id
      console.log "Started session with identifier #{data.id}"
      this.handleResponse(data)
      setInterval(this.reload, 2 * 1000)

  reload: =>
    $.get "/api/lamps/#{@clientIdentifier}", (data)=>
      #data = $.parseJSON(data)
      this.handleResponse(data)

  handleResponse: (data)=>
    @onColorChange(data.color) if @onColorChange