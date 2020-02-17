class FacultiesController < ApplicationController
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
    if @faculty.id == current_user.id
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
      render "faculties/#{@faculty.id}/edit"
    end
  end
  
  private
    def faculty_params
      params.require(:faculty).permit(:name, :image, :content, :release)
    end
  
end
