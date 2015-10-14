# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


posts = Post.create([
  {
    title: "Intro Post",
    published: true,
    is_podcast: false,
    content: "This is a non-podcast post. There are no shownotes.",
    show_notes_match_content: true,
    publish_timestamp: '2015-09-01 22:01:32'
  },
  {
    title: "Intro Episode",
    published: true,
    is_podcast: true,
    content: "This is the episode description. There are seperate show notes.",
    show_notes_match_content: false,
    show_notes: "These are the seperate show notes.",
    audio_file_url: 'http://ia800504.us.archive.org/18/items/en-chrysoberyl-artic/En-Chrysoberyl-article.mp3',
    episode_id: 1,
    publish_timestamp: '2015-09-02 22:01:32'
  },
  {
    title: "Announcement Post",
    published: true,
    is_podcast: false,
    content: "This is a non-podcast post. There are no shownotes.",
    show_notes_match_content: true,
    publish_timestamp: '2015-09-03 22:01:32'
  },
  {
    title: "Second Episode",
    published: true,
    is_podcast: true,
    content: "This is the episode description.",
    show_notes_match_content: true,
    audio_file_url: 'http://ia800502.us.archive.org/6/items/dumb-iron-article-1/Dumb-iron-article-1.mp3',
    episode_id: 2,
    publish_timestamp: '2015-09-04 22:01:32'
  },
])

post_events = PostEvent.create([
  {
    post_id: 4,
    content_type: 'image',
    url: 'http://bloximages.newyork1.vip.townnews.com/dailynebraskan.com/content/tncms/assets/v3/editorial/1/11/111d3344-6653-11e5-878a-7f455e07273c/5609f997d901c.image.jpg',
    content: '',
    time_start: 0,
    time_end: 10
  },
  {
    post_id: 4,
    content_type: 'video_youtube',
    url: 'https://www.youtube.com/watch?v=9D05ej8u-gU',
    content: '',
    time_start: 10,
    time_end: 20
  }
])

user = User.create! :email => 'test@example.com', :password => 'password', :password_confirmation => 'password'
