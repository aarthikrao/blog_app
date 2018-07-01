require "./blog_app/*"
require "kemal"
require "json"
require "mongo"
require "./objects.cr"

# TODO: Write documentation for `BlogApp`

client = Mongo::Client.new "mongodb://localhost:27017/"
db = client["blog_app"]
author_collection = db["author"]
posts_collection = db["blog_posts"]

BLOG_NAME = "Diffrent Notion"
video_link = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/W0fKl43QmIE\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"

get "/" do
  # technology_posts = find_by_in_collection(posts_collection, "theme", "technology", 3)
  # fashion_posts = find_by_in_collection(posts_collection, "theme", "fashion", 3)
  # business_posts = find_by_in_collection(posts_collection, "theme", "business", 3)
  render "public/index.ecr"
end

get "/:post_name" do |env|
  name = env.params.url["post_name"]
  blog_post_bson = find_by_in_collectionOne(posts_collection, "name", name)
  blog_post = Blog_Posts.from_json blog_post_bson.to_json
  suggest = find_by_in_collection(posts_collection, "theme", blog_post.theme, 3)
  render "public/post.ecr"
end


Kemal.config.host_binding = "0.0.0.0"
Kemal.run
