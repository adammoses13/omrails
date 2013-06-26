class CommentsController < ApplicationController

def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.create!(params[:comment])
    redirect_to route_path(@route)
  end

def destroy
   if current_user.try(:admin?)
   	@comment = Comment.find(params[:id])
    @comment.destroy
    
   else 
    
    @comment = Comment.find(params[:id])
    @comment.destroy
  
  end

 respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }

  end
end

end


#if current_user.try(:admin?)
  #  @route = @route.find(params[:route_id])
  #  @comment = @route.comments.find(params[:comment])
  #  @comment.destroy
  #  redirect_to route_path(@route)
#<% end %>