class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    @date = "2016-10-23"
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @date = Date.new(2016,10,23) #TODO: paramitize date
    @staff = User.where("active = ? AND store_id = ?", true, Store.find(1))  #TODO: paramitize store
    @weekSchedule = Schedule.where("date IN (?) AND user_id IN (?)", (Date.new(2016,10,23)..Date.new(2016,10,23).next_day(6)),  (User.where("active = ? AND store_id = ?", true, Store.find(1)).ids))
    @positions = Position.where("scheduleable = ? AND store_id = ?", true, Store.find(1)) #TODO: paramitize store
   
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    deny_request(@schedule)
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:user_id, :position_id, :available, :date, :startTime, :endTime)
    end
    
    def deny_request(schedule)
      requests = Request.where(schedule_id: schedule.id)
      
      requests.each do |request|
        user = User.where(id: request.user_id).first
        if(request.user_id == user.id) then
          puts "###########    I sent an email to " + user.email
        end
        request.destroy
      end
    end
  
end
