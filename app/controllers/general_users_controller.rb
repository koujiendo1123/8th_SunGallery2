class GeneralUsersController < ApplicationController
  def show
    @general_users = current_general_user
  end
end
