$ ->
  $(document).on "submit", "#new_message", (event) ->
    event.preventDefault()
    App.messages.send({
      body: $(event.currentTarget).serializeArray()[2].value
    })

  $(document).on "click", "#special_message", (event) ->
    event.preventDefault()
    App.specialRoom.send({
      body: $("#new_message").serializeArray()[2].value
    })
