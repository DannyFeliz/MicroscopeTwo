Session.setDefault("postSubmitErrors", {})

Template.postSubmit.events
  "submit form": (e) ->
    e.preventDefault()

    post =
      url: $(e.target).find("[name=url]").val()
      title: $(e.target).find("[name=title]").val()

    Meteor.call("postInsert", post, (error, result) ->

      if error then throwError(error.reason) else Router.go("postPage", {_id: result._id})

      throwError("This link has already been posted") if result.postExists
    )

    post._id = Posts.insert(post)
    Router.go("postPage",post)

Template.postSubmit.helpers

  errorMessage: (field) ->
    Session.get("postSubmitErrors")[field]

  errorClass: (field) ->
    if !!Session.get("postSubmitErrors")[field] then "has-error" else ""

  ###sucessClass: (field) ->
    if url.toString().length >= 1 then cosole.log "has-success" else cosole.log "Nada"###