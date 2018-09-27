module FavoritesHelper
  def user_favorites?(user)
    if user.favorite_posts.any?
      render user.favorite_posts
    else
      return "<p>#{user.name} has not favorited any posts yet.</p>".html_safe
    end
  end
end
