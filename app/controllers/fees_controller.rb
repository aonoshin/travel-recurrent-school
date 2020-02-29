class FeesController < ApplicationController
    
  before_action :authenticate_user!
  before_action :admin_check
  
    def index
        @fees = Fee.all.order(updated_at: :desc)
    end
    
    def show
    end
    
    def new
        @fee = Fee.new
    end
    
    def create
        @fee = Fee.new(fee_params)
        if @fee.save
            flash[:notice] = "作成しました！"
            redirect_to "/fees"
        else
            flash[:alert] = "入力に誤りがあります。"
            render "/fees/new"
        end
    end
    
    def edit
        @fee = Fee.find(params[:id])
        if @fee.user_id == current_user.id
        else
            flash[:alert] = "権限がありません。"
            redirect_to "/fees"
        end
    end
    
    def update
        @fee = Fee.find(params[:id])
        if @fee.update(fee_params)
            flash[:notice] = "更新しました！"
            redirect_to "/fees"
        else
            flash[:alert] = "入力に誤りがあります。"
            redirect_to "/fees/#{@fee.id}/edit"
        end
    end
    
    def destroy
        @fee = Fee.find(params[:id])
        if @fee.destroy
            flash[:notice] = "削除しました！"
            redirect_to "/fees"
        else
            flash[:alert] = "削除できませんでした。"
            redirect_to "/fees"
        end
    end
    
    
    private
      def fee_params
          params.require(:fee).permit(:name, :price, :text, :release, :user_id).merge(user_id: current_user.id)
      end
    
    
end
