class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_question, only: [:new, :create]


  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    @answer.save
  end

  def destroy
    @answer = Answer.find(params[:id])
    if current_user && current_user.author_of?(@answer)
      @answer.destroy
      @notice = "Answer succesfully deleted!"
    else
      @notice = "You are not author"
    end
    redirect_to @answer.question, notice: @notice
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)

  end
  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
   params.require(:answer).permit(:body)
  end

end
