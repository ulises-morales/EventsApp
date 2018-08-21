class EventsController < ApplicationController
  def index
    # @localevents = Event.find_by_state(current_user.state)

    @localevents = Event.where("state=?", current_user.state)
    @otherevents = Event.where.not("state=?", current_user.state)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    event = Event.new event_params
    unless event.save
      flash[:errors] = event.errors.full_messages
    end
    redirect_to "/events"
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state).merge(user: current_user)
    end
end
