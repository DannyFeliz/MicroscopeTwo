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
    console.log(@params)
    Posts.findOne({_id: @params._id})
})

Router.onBeforeAction("dataNotFound",
  {
    only: "postPage"
  }
)