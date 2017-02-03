class QuestsController < ApplicationController

  def index
    respond_to do |format|
      format.html {}
      format.json {render json: @quests = Quest.where("
        latitude > #{params[:swlat].to_f} AND
        latitude < #{params[:nelat].to_f} AND
        longitude > #{params[:swlng].to_f} AND
        longitude < #{params[:nelng].to_f}
      ")}
    end
  end

end
