Template.postEdit.events
  "submit form": (e) ->
    e.preventDefault()

    currentPostId = @._id

    postProperties =
      url: $(e.target).find("[name=url]").val()
      title: $(e.target).find("[name=title]").val()

    Posts.update({_id: currentPostId}, {$set: postProperties}, (error) ->
      if error then throwError(error.reason) else Router.go('postPage', {_id: currentPostId})
    )

  "click .delete": (e) ->
    e.preventDefault()

    if confirm "Delete this post?"
      currentPostId = @._id
      Posts.remove({_id: currentPostId})
      Router.go("postsList")