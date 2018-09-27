module CommentsHelper
  def user_is_authorized_for_comment?(comment)
      current_user && (current_user == comment.user || current_user.admin?)
   end

  def user_comments?(user)
    if user.comments.any?
      render partial: "comments", locals: {comments: user.comments}
    else
      return "<p>#{user.name} has not submitted any comments yet.</p>".html_safe
    end
  end
end
