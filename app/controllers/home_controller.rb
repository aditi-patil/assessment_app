class HomeController < ApplicationController
  def index
    @assessments = Assessment.all
  end

  def attempt_test
    @questions = Question.where(assessment_id: params[:id])#.first if params[:id].present?
    # @question = Question.find_by_id(params[:question_id]) if params[:question_id].present?
  end

  def test_result
    questions_count = params[:total_questions].to_i
    @count = 0
    if params[:options].present?
      params[:options].each do |k, v|
        question = Question.find_by_id(k.to_i)
        if question.present?
          if question.answer == v
            @count += 1
          end
        end
      end
    end
    @assessment = Assessment.find_by_id params[:assessment_id]
    marks_per_question = @assessment.marks.to_f / questions_count
    @marks_obtained = @count > 0 ? (marks_per_question * @count) : 0
    @score = @count > 0 ? (@count.to_f / questions_count * 100) : 0
    result_params = {assessment_id: params[:assessment_id], user_id: current_user.id, answers: params[:options], marks: @marks_obtained}
    test_result = TestResult.create(result_params)
  end

  def show_test
    @questions = Question.where(assessment_id: params[:assessment_id])
    @marks_obtained = current_user.test_results.where(assessment_id: params[:assessment_id]).first.marks
    @assessment = Assessment.find_by_id params[:assessment_id]

  end
end
