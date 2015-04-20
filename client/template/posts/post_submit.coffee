Template.postSubmit.events
  "submit form": (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find("[name=url]").val()
      title: $(e.target).find("[name=title]").val()

    Meteor.call("postInsert", post, (error, result) ->

      if(error)
        return console.log(error.reason)
      console.log "Post already exists: => http://localhost:3000/posts/"+result._id
      Router.go("postPage", {_id: result._id})
    )

    post._id = Posts.insert(post)
    Router.go("postPage",post)