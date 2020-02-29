class EventsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check
  
  def index
    @events = Event.all.order(day: :asc)
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "作成しました！"
      redirect_to "/events"
    else
      flash[:alert] = "入力に誤りがあります。"
      render "events/new"
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    if @event.user_id == current_user.id
    else
      flash[:alert] = "権限がありません。"
      redirect_to "/events"
    end
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "変更しました！"
      redirect_to "/events"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/events/#{@event.id}/edit"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/events"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/events"
    end
  end
  
  private
    def event_params
      params.require(:event).permit(:title, :image, :place, :starttime, :day, :endtime, :release, :user_id).merge(user_id: current_user.id)
    end
  
end
