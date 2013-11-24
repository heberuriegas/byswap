class StaticController < ApplicationController
  def home
    @users = User.all
  end
end
