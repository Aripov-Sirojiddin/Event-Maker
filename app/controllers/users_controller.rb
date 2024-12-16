class UsersController < ApplicationController
  before_action :authenticate_user!
  def attending_events
    @events = current_user.attending_events
  end

  def invited_events
    @invitations = current_user.invitiations
  end
end
