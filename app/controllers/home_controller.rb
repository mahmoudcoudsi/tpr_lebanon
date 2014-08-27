class HomeController < ActionController::Base
  protect_from_forgery

  def index
    @lead = Lead.new
    session[:web_lead_params] = {}
    session[:web_lead_params]['id'] = @lead.id
  end

  def soon
    @lead = Lead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lead }
    end
  end

end
