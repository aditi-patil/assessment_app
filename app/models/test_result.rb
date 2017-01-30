class TestResult < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :user
  serialize :answers
  validates :assessment_id, presence: true, uniqueness: {scope: :user_id}
end
