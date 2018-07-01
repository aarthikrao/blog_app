require "mongo"
require "json"

def orm_json_author(author : Author)
  {
    "name"   => author.name,
    "age"    => author.age,
    "author" => author.author,
  }
end

class Author
  JSON.mapping(
    name: String,
    age: {type: Int32, nilable: true},
    author: String
  )
end

def orm_json_posts(blog_post : Blog_Posts)
  {
    "name"        => blog_post.name,
    "uiName"      => blog_post.uiName,
    "description" => blog_post.description,
    "content"     => blog_post.content,
    "author"      => blog_post.author,
    "imageUrl"    => blog_post.imageUrl,
    "createdOn"   => blog_post.createdOn,
    "theme"       => blog_post.theme,
  }
end

class Blog_Posts
  JSON.mapping(
    name: String,
    uiName: String,
    description: String,
    content: String,
    author: String,
    imageUrl: String,
    createdOn: String,
    theme: String
  )
end

def find_by_in_collection(collection, field : String, value, limit : Int32)
  collection.find({field => value}, BSON.new, LibMongoC::QueryFlags::NONE, 0, limit)
end

def find_by_in_collectionOne(collection, field : String, value)
  collection.find_one({field => value}, BSON.new, LibMongoC::QueryFlags::NONE)
end
