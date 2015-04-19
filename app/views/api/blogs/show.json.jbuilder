json.blog do
  json.id    @blog.id
  json.title @blog.title
  json.body @blog.body
  json.created_at @blog.created_at
  json.updated_at @blog.updated_at

  # json.user_id blog.user ? blog.user.id : nil
end
