class Account::CommentsController < ApplicationController
  protect_from_forgery with: :exception
  layout 'account'
  before_action :authenticate_user!

  def create
    @comment = Comment.create(
      user_id: current_user.id,
      content: params[:comment][:content],
      listing_id: params[:comment][:listing_id]
    )
    # raise @comment.inspect
  end

end
