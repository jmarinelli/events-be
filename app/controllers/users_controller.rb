class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :favorited_event, :registered_events]
  before_action :set_event, only: [:favorited_event, :registered_events]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user, serializer: UserDetailSerializer
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(edit_user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # POST /users/1/favorited_events
  def favorited_event
    @user.favorited_events << @event

    if @user.errors.empty?
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /users/1/registered_events
  def registered_events
    @user.registered_events << @event

    if @user.errors.empty?
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def edit_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, 
                                  :birthdate, :picture)
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :user_name, :password, 
                                  :active, :birthdate, :picture)
    end
end
