class AtendeesController < ApplicationController
  def create
    Atendee.create atendee_params
    redirect_to "/events"
  end

  def destroy
    @atendee = Atendee.find(params[:id])
    @atendee.destroy if current_user === @atendee.user
    redirect_to "/events" 
  end


  private
    def atendee_params
      params.require(:atendee).permit(:event_id).merge(user: current_user)
    end
end
