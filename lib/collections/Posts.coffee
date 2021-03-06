@Posts = new Mongo.Collection("posts")

Posts.allow
  update: (userId, post) ->
    return ownsDocument(userId, post)
  remove: (userId, post) ->
    return ownsDocument(userId, post)

Posts.deny
  update: (userId, post, fieldNames) ->
    return (_.without(fieldNames, 'url', 'title').length > 0)

    
Meteor.methods(
  postInsert: (postAttributes) ->
    expect(Meteor.userId()).to.be.a("String")
    expect(postAttributes.title).to.be.a("String")
    expect(postAttributes.url).to.be.a("String")


    postWithSameLink = Posts.findOne({url: postAttributes.url})
    if postWithSameLink
      return {
        postExists: true
        _id: postWithSameLink._id
      }

    user = Meteor.user()
    post = _.extend(postAttributes,
      userId: user._id
      author: user.username
      submitted: new Date()
    )

    postId = Posts.insert(post)

    return {
      _id: postId
    }

)
