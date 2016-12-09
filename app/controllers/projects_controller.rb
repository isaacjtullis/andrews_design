class ProjectsController < ApplicationController
  def index
    @user = User.new
  end
end
