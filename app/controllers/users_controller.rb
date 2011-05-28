class UsersController < ApplicationController
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
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
	if @user.save
	  flash[:success] = "Your details are saved!"
	  redirect_to @user
    else
	  @title = "Sign up"
	  render 'new'
	end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
	
	else

    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end
end
