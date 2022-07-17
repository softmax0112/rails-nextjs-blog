class PostsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :body, :user, :get_image_url, :likes
end
