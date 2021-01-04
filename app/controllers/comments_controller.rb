class CommentsController < ApplicationController
    before_action :authenticate_account!        
    def new
        if account_signed_in?
            @comment = current_account.comments.new
        end
    end   

    def create
        @comment = current_account.comments.new(comment_params)
        @comment.shop_id = params[:shop_id]
        if @comment.save
            redirect_back fallback_location: root_url, notice:"コメントが投稿されました。"
        else
            redirect_back fallback_location: root_url, notice:"コメントが失敗しました。"
        end

    end 

    def destroy
        current_account.comments.find_by(id: params[:id]).destroy
        redirect_back fallback_location: root_url, notice:"コメントを削除しました。"
    end    

    private
    def comment_params
        params.require(:comment).permit(:content, :recommended, :shop_id, :image, :bitterness, :acidity, :fragrance, :rich, :sweetness)
    end
end
