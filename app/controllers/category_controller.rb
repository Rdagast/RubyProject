class CategoryController < ApplicationController
  def index
    @category= Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(listing_params)

    #respond_to do |format|
      if @category.save
        #format.html { redirect_to @task, notice: 'Task was successfully created.' }
        #format.json { render :show, status: :created, location: @task }
        redirect_to category_path(@category.id), notice: 'Listing was successfully created.'
      else
        render:new
        #format.html { render :new }
        #format.json { render json: @task.errors, status: :unprocessable_entity }
      end
  end
  def show
    @category = Category.find(params[:id])
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:category).permit(:name, :description, :picture, :price)
    end

end
