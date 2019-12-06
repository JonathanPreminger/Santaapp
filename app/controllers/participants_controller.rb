class ParticipantsController < ApplicationController

  def create
    @participant = Participant.create(participant_params)
    if @participant.save
      flash[:success] = "bingo"
      redirect_to participants_path
    else
      flash[:error] = "failed "
      redirect_to participants_path
    end
  end

  def new
    @participant = Participant.new(params[:participant])
  end

  def index
    @participants = Participant.all
  end

  def destroy
    Participant.find(params[:id]).destroy
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email)
  end

end
