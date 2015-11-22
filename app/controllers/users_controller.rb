class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :following, :followers]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if logged_in?
      redirect_to current_user
    end
    @user = User.new
  end

  def create
    newUser = params[:user]
    @user = User.new(username: newUser[:username], name: newUser[:name], email: newUser[:email], password: newUser[:password])
    if @user.save
      log_in @user
      flash[:success] = "Usuario #{@user.username} creado con éxito!"
      redirect_to users_path
    else
      flash.now[:error] = "Ocurrió un error creando el usuario #{params[:user][:username]}"
      render action: 'new'
    end
  end

  def edit
    if current_user.id.to_s != params[:id]
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end

  def update
    if current_user.id.to_s != params[:id]
      redirect_to root_path
    end
    editedUser = params[:user]
    begin
      @user = User.find(params[:id])
      if @user.authenticate(editedUser[:current_password])
        @user.name = editedUser[:name]
        @user.email = editedUser[:email]
        if not editedUser[:new_password].empty?
          @user.password = editedUser[:new_password]
          puts "lol #{editedUser[:new_password]}"
        end
        if @user.save
          flash[:success] = "Usuario #{@user.username} editado con éxito!"
          redirect_to @user
        else
          flash.now[:error] = "Ocurrió un error editando el usuario #{@user.username}"
          render action: 'edit'
        end
      else
        flash.now[:error] = "La contraseña no es correcta"
        render action: 'edit'
      end
    rescue Exception
      flash[:error] = "No se pudo encontrar el usuario"
      redirect_to users_path
    end
  end

  def following
    @title = "Siguiendo"
    @user = User.find(params[:id])
    @users = @user.following
    @no_users = "No sigues a nadie."
    render 'show_follow'
  end

  def followers
    @title = "Seguidores"
    @user = User.find(params[:id])
    @users = @user.followers
    @no_users = "No tienes seguidores."
    render 'show_follow'
  end
end
