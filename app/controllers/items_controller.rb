class ItemsController < ApplicationController
  before_action :move_to_new_user_session, only: [:new]

  def index
    
  end


  private
  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
