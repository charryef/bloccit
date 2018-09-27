module PostsHelper
  def user_is_authorized_for_posts?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def user_posts?(user)
    if user.posts.any?
      render partial: "posts", locals: {posts: user.posts}
    else
      return "<p>#{user.name} has not submitted any posts yet.</p>".html_safe # .html_safe allows strings with html tags
    end
  end
end
