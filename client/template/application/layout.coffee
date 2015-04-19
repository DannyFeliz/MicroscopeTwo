Session.setDefault("pageTitle","Microscope")
Template.layout.helpers
  pageTitle: ->
    return Session.get("pageTitle")