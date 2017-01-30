class PagesController < ApplicationController

  def home
    unless current_user
      redirect_to new_user_registration_path
    end
  end

  def friends
    @friends = current_user.friends
    @requested_friends = current_user.requested_friends
    @pending_friends = current_user.pending_friends

  end

  def find_user
    email = params[:email]
    sought_user = User.find_by(email: email)
    unless sought_user.nil?
      current_user.friend_request(sought_user)
    else
      # error
    end
    binding.pry
  end

end
