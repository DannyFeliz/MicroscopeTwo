Router.configure
  layoutTemplate: "layout"
  loadingTemplate: 'loading'
  notFoundTemplate: "notFound"
  waitOn: ->
    return Meteor.subscribe("posts")

Router.route("/",
  {
    name: "postsList"
  })

Router.route("/posts/:_id",{
  name: "postPage",
  data: ->
    Posts.findOne({_id: @params._id})
})

Router.route("/posts/:_id/edit", {
  name: "postEdit",
  template: "postEdit"
  data: ->
    Posts.findOne({_id: @params._id})
})

Router.route("/submit",{
  name: "postSubmit",
  template: "postSubmit"
})

requireLogin = ->
  if Meteor.userId()
    if Meteor.loggingIn()
      @render(@loadingTemplate)
      @render.loadingTemplate
    @next()
  else
    @render "accessDenied"


Router.onBeforeAction("dataNotFound",
  {
    only: "postPage"
  }
)

Router.onBeforeAction(requireLogin, {only: "postSubmit"})
