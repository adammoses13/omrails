class CommentsController < ApplicationController

def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.create(params[:comment])
    redirect_to route_path(@route)
  end

def destroy
   if current_user.try(:admin?)
   	@route = @route.find(params[:route_id])
    @comment = @route.comments.find(params[:comment])
    @comment.destroy
    redirect_to route_path(@route)
   else 
    @route = Route.find(params[:route_id])
    @comment = @route.comments.find(params[:comment])
    @comment.destroy
    redirect_to route_path(@route)
  end

 respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }

  end
end

end
