class Assessment < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :test_results, dependent: :destroy

  def get_test_assessments(user)
    user.test_results.where(assessment_id: self.id)
  end

  def check_valid_dates?
    (start_date <= Date.today && end_date > Date.today)
  end
end
