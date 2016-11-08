class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    @date = Date.today.beginning_of_week
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @currentUser = current_user.id #TODO: paramitize user for user-typing 1=admin other=non-admin
    @date = Date.today.beginning_of_week
    @staff = User.where("active = ? AND store_id = ?", true, Store.find(1))  #TODO: paramitize store
    @weekSchedule = Schedule.where("date IN (?) AND user_id IN (?)", (@date..@date.next_day(6)),  (User.where("active = ? AND store_id = ?", true, current_user.store_id).ids))
    @positions = Position.where("scheduleable = ? AND store_id = ?", true, current_user.store_id) #TODO: paramitize store
    @schedule = Schedule.new
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
    if params[:schedule][:id].present?
      @schedule = Schedule.find(params[:schedule][:id]).update(schedule_params)
    redirect_to :back
    else
      @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to :back, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    deny_request(@schedule)
    @schedule = Schedule.find(params[:id]).update(schedule_params)
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
    @schedule = Schedule.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      if (params[:id] != "show")
        @schedule = Schedule.find(params[:id])
      else
        @schduele = Schedule.all
      end
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
