class ProfilesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check  
  
  def index
    @profiles = Profile.all
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = "作成しました！"
      redirect_to "/profiles"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to  "/profiles/new"
    end
  end
  
  def edit
    @profile = Profile.find(params[:id])
    if @profile.user_id == current_user.id
    else
      flash[:alert] = "権限がありません。"
      redirect_to "/"
    end
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "編集しました！"
      redirect_to "/profiles"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/profiles/#{@profile.id}/edit"
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    if @profile.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/profiles"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/profiles"
    end
  end
  
  
  
  private
    def profile_params
      params.require(:profile).permit(:image, :name, :birthday, :age, :place, :area, :work, :hobby, :country, :content, :career, :user_id).merge(user_id: current_user.id)
    end
  
  
  
end
