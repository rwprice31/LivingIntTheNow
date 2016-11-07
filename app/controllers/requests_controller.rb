class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user! ####################################### This is for Devise

  def availableShifts
    @schedule = Schedule.where(available: true, position: current_user.position).to_a
    shifts = current_user.schedule
    #Write something to filter out the conflicting shifts
    
    #Compare each user.shift to each available shift
    @schedule.each do |available|
      shifts.each do |shift|
        
        #Check the available shift's date matches the user's shift's date (We are looking for conflicts)
        if (available.date == shift.date) then
          
          #Check the available shift's start and end time to see if they come before the user shift's start time
          if(available.startTime.utc.strftime('%H%M') < shift.startTime.utc.strftime('%H%M'))
            if(available.endTime.utc.strftime('%H%M') <= shift.startTime.utc.strftime('%H%M'))
              puts "############ " + available.startTime.utc.strftime('%H%M') + " - " + available.endTime.utc.strftime('%H%M')
              puts "############ " + shift.startTime.utc.strftime('%H%M') + " - " + shift.endTime.utc.strftime('%H%M')
              puts "############ Shift is available"
            else
              @schedule.reject! {|a| a.id == available.id}
              puts "############"
              puts "############"
              puts "############"
              puts "############"
              puts "############ GET DUNKED ON"
            end
            
          #Otherwise check that the available shift's start time comes after the user shift's end time
          elsif(available.startTime >= shift.endTime)
            puts "############ " + available.startTime.utc.strftime('%H%M') + " - " + available.endTime.utc.strftime('%H%M')
            puts "############ " + shift.startTime.utc.strftime('%H%M') + " - " + shift.endTime.utc.strftime('%H%M')
            puts "############ Shift is available"
          else
            @schedule.reject! {|a| a.id == available.id}
            puts "############"
            puts "############"
            puts "############"
            puts "############"
            puts "############ GET DUNKED ON"
          end
        end
      end
      
    end
  end

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.create(request_params)
    
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
      #TODO: Add email notification here
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:schedule_id, :user_id)
    end
    
    def approve_request
      
    end
end
