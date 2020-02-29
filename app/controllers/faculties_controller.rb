class FacultiesController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_check
  
  def index
    @faculties = Faculty.all.order(updated_at: :desc)
  end
  
  def show
    @faculty = Faculty.find(params[:id])
  end
  
  def new
    @faculty = Faculty.new
  end
  
  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:notice] = "作成しました！"
      redirect_to "/faculties"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "faculties/new"
    end
  end
  
  def edit
    @faculty = Faculty.find(params[:id])
    if @faculty.user_id == current_user.id
    else
      flash[:alert] = "権限がありません。"
      redirect_to "/faculties"
    end
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      flash[:notice] = "更新しました！"
      redirect_to "/faculties"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/faculties/#{@faculty.id}/edit"
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
     if @faculty.destroy
         flash[:notice] = "削除しました！"
         redirect_to "/faculties"
     else
         flash[:alert] = "削除できませんでした。"
        redirect_to "/faculties"
     end
  end
    
  private
    def faculty_params
      params.require(:faculty).permit(:name, :image, :content, :release, :user_id).merge(user_id: current_user.id)
    end
  
end
