class RoutesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
 

  # GET /routes
  # GET /routes.json
  def index
  if params[:search]
    @routes = Route.search(params[:search]).order("created_at desc").page(params[:page]).per_page(25)
  else 
    @routes = Route.order("created_at desc").page(params[:page]).per_page(25)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
      #format.js  #to add endless scroll
   end
  end
  end

def myroutes
  @routes = Route.order("created_at desc").page(params[:page]).per_page(25).find_all_by_user_id current_user[:id]

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @routes }
  end
end

  # GET /routes/1
  # GET /routes/1.json
  
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = current_user.routes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    if current_user.try(:admin?)
      @route = Route.find(params[:id])
    else
      @route = current_user.routes.find(params[:id])
    end
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = current_user.routes.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    if current_user.try(:admin?)
      @route = Route.find(params[:id])
    else
      @route = current_user.routes.find(params[:id])
    end
    
    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
   if current_user.try(:admin?)
    @route = Route.find(params[:id])
    @route.destroy
   else 
    @route = current_user.routes.find(params[:id])
    @route.destroy
  end

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }


    end
  end

end
