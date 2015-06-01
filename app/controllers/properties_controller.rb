class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    property = Property.create(property_params)
    if property.save
      redirect_to property_path
    else
      render :new
    end
  end

  def edit
    @property = Property.find params[:id]
  end

  def update
    property = Property.find params[:id]
    #raise params.inspect
    property.update property_params
    redirect_to property_path(params[:id])
  end

  def show
    @property = Property.find params[:id]
  end

  def destroy
  end


  private
  def property_params
    params.require(:property).permit(:title, :image, :street_address, :city, :state, :country, :property_type_id, :description, :rent, :beds, :baths, :max_people, :min_stay, :check_in_time, :check_out_time, :pets, :user_id, :active)
  end
end
