class QuestionsController < ApplicationController
  def subject_ids
    question_subjects.collect{|o| o.id}
  end

  def subject_ids= subjects_ids
    subjects_ids.each do |id|
      question_subjects << Subject.find(id)
    end
  end

  def competency_ids
    question_competencies.collect{|o| o.id}
  end

  def competency_ids= competencies_ids
    competencies_ids.each do |id|
      question_competencies << Competency.find(id)
    end
  end

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
      question_subjects_attributes: [:id, :subject_id],
      question_competencies_attributes: [:id, :competency_id],
      options_attributes: [:id, :option, :is_correct],
      statement_files: [], # Para arquivos relacionados ao statement
      options_attributes: [:id, :option, :is_correct, :option_files => []], # Para arquivos relacionados às options
      subject_ids: [], # Atributos adicionais permitidos
      competency_ids: [] # Atributos adicionais permitidos
    )
  end

  def option_params
    params.require(:option).permit(
      files: []
    )
  end
end
