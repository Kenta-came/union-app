class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :profile_params_id, except: [:index,:new, :create]
  
  def index
    @profiles = Profile.order("created_at DESC")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @profile.user.id == current_user.id
    
       @profile.destroy
    end
      redirect_to root_path
  end

  def show
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @profile.user.id)
    if @profile.user.id == current_user.id
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
    if @profile.user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:gender_id, :form_id, :profession_name, :want_to_do, :can_do_list, :image,).merge(user_id: current_user.id, profile_id: params[:profile_id])
  end

  def profile_params_id
    @profile = Profile.find(params[:id])
  end
end
