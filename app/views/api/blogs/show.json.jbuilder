json.blog do
  json.id    @blog.id
  json.title @blog.title
  json.body @blog.body

  # json.user_id blog.user ? blog.user.id : nil
end
