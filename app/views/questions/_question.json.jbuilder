json.extract! question, :id, :question, :option_a, :option_b, :option_c, :option_d, :answer, :assessment_id, :created_at, :updated_at
json.url question_url(question, format: :json)