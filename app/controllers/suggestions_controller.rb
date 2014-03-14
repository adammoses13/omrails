class SuggestionsController < ApplicationController
  
  def new
    @suggestion = Suggestion.new
  end
    
  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.deliver
      redirect_to root_path, notice: "Thank you!  Your suggestion has been submitted."
    else
      render :new
    end
  end
  
end