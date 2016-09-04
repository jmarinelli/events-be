class EventsController < ApplicationController
  wrap_parameters include: Event.attribute_names + [:activities_attributes]
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.filter_events(events_query)

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event, serializer: EventDetailSerializer
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def events_query
      params.permit(:distance, :country_id, :state_id, :city_id, :first_date, :last_date, :category_ids => [])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :author, :country_id, :state_id, :city_id, 
                                    :category_id, :published, :deleted, :link, :contact_email, 
                                    :contact_phone, :start_date, :end_date, tags: [],
                                    activities_attributes: [:id, :link, :start_date, :end_date, 
                                                            :price, tags: []])
    end
end
