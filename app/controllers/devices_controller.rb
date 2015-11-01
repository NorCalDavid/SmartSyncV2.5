class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_device, only: [:show, :edit, :update, :adjust_dim_level, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :update

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(create_params)

    respond_to do |format|
      if @device.save
        current_user.devices << @device
        format.html { redirect_to dashboard_path, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def adjust_dim_level
    render partial: 'adjust_dim_level', status: :created
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    changed = (@device.status_code != params[:status_code])
    respond_to do |format|
      if @device.update(update_params)
        @device.update_controls(@token) if changed
        format.html { redirect_to dashboard_path }
        format.json { render nothing: true, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :description, :status_code, :brand, :type, :location, :EDID, :version, :image, :property_id, :room_id, :status_code, :status, :favorite)
    end

    def create_params
      device_params.merge(created_by: current_user.id)
    end

    def update_params
      device_params.merge(updated_by: current_user.id)
    end

end
