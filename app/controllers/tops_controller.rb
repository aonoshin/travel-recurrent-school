class TopsController < ApplicationController
    
    def index
        @faculties = Faculty.all.order(updated_at: :desc)
        @events = Event.all.order(day: :asc)
        @fees = Fee.all.order(updated_at: :desc)
        @news = News.all.order(created_at: :desc)
        @profiles = Profile.all
    end
end
