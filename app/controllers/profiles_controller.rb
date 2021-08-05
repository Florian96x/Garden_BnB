class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
    authorize @profile
  end
end
