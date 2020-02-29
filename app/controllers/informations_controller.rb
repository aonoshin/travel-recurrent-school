class InformationsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check
  
  def index
    @informations = Information.all.order(updated_at: :desc)
  end
  
  def show
    @information = Information.find(params[:id])
  end
  
  def new
    @information = Information.new
  end
  
  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:notice] = "作成しました！"
      redirect_to "/informations"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "informations/new"
    end
  end
  
  def edit
    @information = Information.find(params[:id])
    if @information.id == current_user.id
    else
      flash[:alert] = "権限がありません。"
      redirect_to "/informations"
    end
  end
  
  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      flash[:notice] = "変更しました！"
      redirect_to "/informations"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "informations/#{@information.id}/edit"
    end
  end
  
  def destroy
    @information = Information.find(params[:id])
    if @information.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/informations"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/informations"
    end
  end
  
  private
    def information_params
      params.require(:information).permit(:content, :release, :user_id).merge(user_id: current_user.id)
    end
  
end
