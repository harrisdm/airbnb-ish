class PropertiesController < ApplicationController
  def index
    if params[:search].present?
      @properties = Property.near(params[:search], 50, :order => :rent)
    else
      @properties = Property.all
    end
    # @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
    #   marker.lat property.latitude
    #   marker.lng property.longitude
    #   marker.infowindow "$#{property.rent}"

    #   marker.json({ title: "$#{property.rent.round()}", html: link_to(property.title, property) })
    # end
    #raise params.inspect
    # MOVED TO THE VIEW FOR HELPER ACTION
  end

  def new
    @property = Property.new
  end

  def create
    property = Property.create(property_params)
    if property.save
      redirect_to property_path(property.id)
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
    params.require(:property).permit(:title, :image, :address, :property_type_id, :description, :rent, :beds, :baths, :max_people, :min_stay, :check_in_time, :check_out_time, :pets, :user_id, :active)
  end

end
