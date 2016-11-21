class ListingsController < ApplicationController
  def index
    # @listing= Listing.all
    @listing = Listing.search(params)
  end
  def new
    redirect_to new_user_session_path unless current_user
    @listing = Listing.new
  end
  def create
    # raise params.inspect
    @listing = Listing.new(listing_params)

    #respond_to do |format|
      if @listing.save
        #format.html { redirect_to @task, notice: 'Task was successfully created.' }
        #format.json { render :show, status: :created, location: @task }
        redirect_to listing_path(@listing.id), notice: 'Listing was successfully created.'
      else
        render:new
        #format.html { render :new }
        #format.json { render json: @task.errors, status: :unprocessable_entity }
      end
  end
  def show
    @listing = Listing.find(params[:id])
  end
  def contact
    Contact.generate(params,current_user)

    render nothing: true
  end
  def edit
    @listing = Listing.find(params[:id])
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :description, :picture, :price, :category_id)
    end
end
