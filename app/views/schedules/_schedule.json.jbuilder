json.extract! schedule, :id, :user_id, :position_id, :available, :date, :startTime, :endTime, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)