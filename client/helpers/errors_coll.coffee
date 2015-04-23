@Errors = new Mongo.Collection(null)

@throwError = (message) ->
  console.log(message)
  Errors.insert({message: message})