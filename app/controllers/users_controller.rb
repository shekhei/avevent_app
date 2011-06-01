class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:edit, :update, :destroy]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
	@title = "Sign up"
  end

  # GET /users/1/edit
  def edit
	@title = "Edit user"
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
	if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to Staff Basecamp"
	  redirect_back_or @user
    else
	  @title = "Sign up"
	  render 'new'
	end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update

    if @user.update_attributes(params[:user])
	  flash[:success] = "Profile updated."
	  redirect_to @user
	else
      @title = "Edit user"
	  render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end

end
