class EventsController < ApplicationController
  include ::Matching

  before_action :authenticate_user!

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "success"
      redirect_to events_path
    else
      flash[:error] = "failed "
      redirect_to events_path
    end
    Participant.create(name:current_user.name, email:current_user.email, event_id:@event.id)
  end

  def new
    @event = Event.new(params[:event])
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    flash[:notice] = "#{@event.title} was successfully updated."
    redirect_to event_path
  end

  def show
    @event = Event.find(params[:id])
    @participants = @event.participants
    matching(@participants)

    if @event.final_confirmation == true
     @block.each do |block|
        giver = block[0]
        receiver = block[1]
        EventMailer.notification_to_pers_giver(@event.user, giver, receiver).deliver_later
      end
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "event deleted"
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:title, :amount, :final_confirmation, participants_attributes: [:id, :name, :email, :_destroy])
  end

end
