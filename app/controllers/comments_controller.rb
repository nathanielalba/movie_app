class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.user = current_user.email

		if @comment.save
			redirect_to @commentable, notice: "Your comment was successfully posted."
		else
			render 'new'
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:body, :user)
		end
end
