class Question < ActiveRecord::Base

  belongs_to :assessment

  def next
    assessment.questions.where('id > ?', id).first
  end
  def previous
    assessment.questions.where('id < ?', id).first
  end
  def get_check_values(user, option)
    value = assessment.test_results.where(user_id: user.id).first.answers["#{self.id}"]
    return ((value.present? && option == value) ? true :false)
  end
end
