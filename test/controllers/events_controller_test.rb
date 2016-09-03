require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { author: @event.author, category_id: @event.category_id, city_id: @event.city_id, contact_email: @event.contact_email, contact_phone: @event.contact_phone, country_id: @event.country_id, end_date: @event.end_date, end_time: @event.end_time, link: @event.link, name: @event.name, start_date: @event.start_date, start_time: @event.start_time, state_id: @event.state_id, status: @event.status } }, as: :json
    end

    assert_response 201
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { author: @event.author, category_id: @event.category_id, city_id: @event.city_id, contact_email: @event.contact_email, contact_phone: @event.contact_phone, country_id: @event.country_id, end_date: @event.end_date, end_time: @event.end_time, link: @event.link, name: @event.name, start_date: @event.start_date, start_time: @event.start_time, state_id: @event.state_id, status: @event.status } }, as: :json
    assert_response 200
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event), as: :json
    end

    assert_response 204
  end
end
