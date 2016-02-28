App.specialRoom = App.cable.subscriptions.create { channel: "RoomChannel", room: "special" },
  received: (data) ->
    $(".SpecialMessages").append("<li>#{data.message}</li>")
