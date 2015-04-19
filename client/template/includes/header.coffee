Session.setDefault("pageTitle","Microscope")
Template.header.helpers
  pageTitle: ->
    return Session.get("pageTitle")