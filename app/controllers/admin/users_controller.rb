class Admin::UsersController < ApplicationController

  before_filter :per_load
  def per_load
    @user = User.find_by_id(params['id']) if params['id']
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      return redirect_to :action => :index
    end
    render :action => :new
  end
  
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to :action => :index
    end
  end

  def show
  end

  def delete
    if @user.destory
      redirect_to :action => :index
    end
  end

end
