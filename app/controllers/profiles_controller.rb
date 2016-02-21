class ProfilesController < ApplicationController
  check_authorization
  authorize_resource :only => [:index, :edit, :show, :update]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    #authorize! :edit, Profile
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      current_user.profile = @profile
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      flash[:success] = 'Profile was successfully updated.'
      redirect_to @profile
    else
      render :edit
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :birth_date, :gender, :address, :city, :state, :country, :zipcode, :phone)
  end
end
