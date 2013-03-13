class Admin::UsersController < ApplicationController

  # 验证用户是否登录
  before_filter :authenticate_user! 

  before_filter :per_load
  def per_load
    @user = User.find(params['id']) if params['id']
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

  def destroy
    if @user.destroy
      redirect_to :action => :index
    end
  end

end
