class PostsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :body, :author, :image
end
