class ProjectsController < ApplicationController
  def index
    @user = User.new
    @mary = Admin.find(3)
    @tyler = Admin.find(2)
    @isaac = Admin.find(1)
  end
end
