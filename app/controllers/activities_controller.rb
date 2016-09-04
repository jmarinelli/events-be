class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]
  before_action :set_event, only: [:index, :create]

  # GET /activities
  def index
    @activities = @event.activities

    render json: @activities
  end

  # GET /activities/1
  def show
    render json: @activity
  end

  # POST /activities
  def create
    @activity = Activity.new(activity_params)
    @event.activities << @activity

    if @event.save
      render json: @activity, status: :created
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:event_id, :link, :start_date, :end_date, :published, 
                                      :deleted, :price, :tags => [])
    end
end
