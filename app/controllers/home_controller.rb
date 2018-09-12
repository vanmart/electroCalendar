class HomeController < ApplicationController
  
  def landing
    if user_signed_in?
      redirect_to root_path
    end
  end

  def welcome
  end
end
