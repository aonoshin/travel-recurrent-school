class AdminsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :admin_check
  
  def index
  end
  
end
