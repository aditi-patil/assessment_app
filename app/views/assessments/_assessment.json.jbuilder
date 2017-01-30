json.extract! assessment, :id, :title, :marks, :max_time, :start_date, :end_date, :created_at, :updated_at
json.url assessment_url(assessment, format: :json)