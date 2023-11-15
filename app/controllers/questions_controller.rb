class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:author, :topic, :grade, :statement, subject_ids: [])
  end
end
