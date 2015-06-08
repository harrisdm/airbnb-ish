class PropertiesController < ApplicationController

  before_action :clear_session_url

  def index
    if params[:search].present?
      @properties = Property.where(:active => true).near(params[:search], 50, :order => :rent)
    else
      @properties = Property.where(:active => true)
    end

    # Paginate the search results
    @properties = @properties.paginate(:per_page => 6, :page => params[:page])

    # Build the collection of markers to place on the map
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
      marker.lat property.latitude
      marker.lng property.longitude
      marker.infowindow "$#{property.rent}"
      html = view_context.property_listing(property)
      marker.json({ title: "$#{property.rent.round}", html: html })
    end
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
    property.update property_params               # Update the property
    redirect_to property_path(params[:id])        # Return to the property page
  end

  def show
    @property = Property.find params[:id]
  end

  def destroy
    property = Property.find params[:id]
    if property.user_id == @current_user.user_id  # Check that the user owns the property
      property.update_attribute(:active, false)   # Update the property
      redirect_to user_properties_path            # Return to the property list
    else
      redirect_to login_path                      # Ask the user to login
    end
  end
 

  private
  def property_params
    params.require(:property).permit(:title, :image, :address, :property_type_id, :description, :rent, :beds, :baths, :max_people, :min_stay, :check_in_time, :check_out_time, :pets, :user_id, :active)
  end

end



