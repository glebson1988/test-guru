class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: 'Вопросы теста: <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Вопрос: <%= Question.find(params[:id]).inspect %>'
  end

  def new; end

  def create
    @question = @test.questions.create!(question_params)
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден!'
  end
end
