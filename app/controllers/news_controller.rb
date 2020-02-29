class NewsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check
  
  def index
    @news = News.all.order(updated_at: :desc)
  end
  
  def show
    @news = News.find(params[:id])
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new(news_params)
    if @news.save
      flash[:notice] = "作成しました！"
      redirect_to "/news"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "news/new"
    end
  end
  
  def edit
    @news = News.find(params[:id])
    if @news.user_id == current_user.id
    else
      flash[:alert] = "権限がありません。"
      redirect_to "/news"
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      flash[:notice] = "更新しました！"
      redirect_to "/news"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "news/#{@news.id}/edit"
    end
  end

  def destroy
    @news = News.find(params[:id])
     if @news.destroy
         flash[:notice] = "削除しました！"
         redirect_to "/news"
     else
         flash[:alert] = "削除できませんでした。"
        redirect_to "/news"
     end
  end
    
  private
    def news_params
      params.require(:news).permit(:content, :release, :user_id).merge(user_id: current_user.id)
    end
  
end
