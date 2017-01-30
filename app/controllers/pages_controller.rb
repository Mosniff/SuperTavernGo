class PagesController < ApplicationController

  def home
    unless current_user
      redirect_to new_user_registration_path
    end
  end

end
