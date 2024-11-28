class PagesController < ApplicationController
  def home
    @user = current_user if user_signed_in?
  end

  def users_events
  end
end
