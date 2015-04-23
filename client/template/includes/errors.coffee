Template.errors.helpers
    errors: ->
      return Errors.find()

Template.errorItem.onRendered ->
  error = @data
  Meteor.setTimeout (->
    Errors.remove error._id
  ), 3000
