class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:about]
  def home
  end

	def action
	end

def myroutes
  @routes = Route.order("created_at desc").page(params[:page]).per_page(25).find_all_by_user_id current_user[:id]

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @routes }
  end
end

end
