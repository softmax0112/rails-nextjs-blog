class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :posts, :avatar, :bio
end
