class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    newUser = params[:user]
    @user = User.new(username: newUser[:username], name: newUser[:name], email: newUser[:email], password: newUser[:password])
    if @user.save then
      flash[:success] = "Usuario #{@user.username} creado con éxito!"
      redirect_to users_path
    else
      flash.now[:error] = "Ocurrió un error creando el usuario #{params[:user][:username]}"
      render action: 'new'
    end
  end
end
