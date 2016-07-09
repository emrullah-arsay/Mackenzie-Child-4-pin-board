class CommentsController < ApplicationController
	 before_action :set_comment, only: [:show, :edit, :update, :destroy]
	def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(params[:comment].permit(:name, :body))

    redirect_to pin_path(@pin)
  end


 	 def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    @comment.destroy

    redirect_to pin_path(@pin)
   end

  	private
 
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
	end

end
