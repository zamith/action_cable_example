App.messages = App.cable.subscriptions.create "MessagesChannel",
  received: (data) ->
    $(".Messages").append("<li>#{data.message}</li>")
