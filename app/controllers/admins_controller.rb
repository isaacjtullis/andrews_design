class AdminsController < ApplicationController

  def index
    @mary = Admin.find(3)
    @tyler = Admin.find(2)
    @isaac = Admin.find(1)
    render :layout => 'layouts/admin'
  end
end
