class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
  end

  def new
    @question = Question.new
    4.times { @question.options.build }
    @question.question_subjects.build
    @question.question_competencies.build
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
    params.require(:question).permit(
      :author, :topic, :grade, :statement,
      subject_ids: [],
      competency_ids: [],
      question_subjects_attributes: [:id, :subject_id],
      question_competencies_attributes: [:id, :competency_id],
      options_attributes: [:id, :option, :is_correct]
    )
  end
end
