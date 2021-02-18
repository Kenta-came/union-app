class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

  def index
    @users = User.all
    @users = User.search(params[:search])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def followed
    user = User.find(params[:id])
    if user.followed 
      user.update(followed: false)
    else
      user.update(followed: true)
    end

    flw = User.find(params[:id])
    render json: { user: flw }
  end

  def show
    @users = User.all
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    if @user.id == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  

  def user_params
    params.require(:user).permit(:nickname,:birthday,:password,:password_confirmation, :gender_id, :form_id, :profession_name, :want_to_do, :can_do_list, :image)
  end 

end
