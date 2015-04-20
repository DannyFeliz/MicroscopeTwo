if Posts.find().count() is 0
  Posts.insert({
    title: "Taringa! - Inteligencia Colectiva",
    url: "http://taringa.net"
    author: "The Guy"
    userId: 789798
    submitted: new Date()
  })

  Posts.insert({
    title: "Google! - Don't be evil",
    url: "http://google.com.do"
    author: "Larry Page"
    userId: 123456
    submitted: new Date()
  })

  Posts.insert({
    title: "YouTube - Broadcast youtselft",
    url: "http://youtube.com"
    author: "Google"
    userId: 456456
    submitted: new Date()
  })