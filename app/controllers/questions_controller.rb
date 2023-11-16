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

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully destroyed.'
  end

  def new
    @question = Question.new
    @question.options.build
    @question.question_subjects.build
    @question.question_competencies.build
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      # Ao criar a questão, devemos criar seus models atrelados, Question Subject, Question Competencies
      build_subject_inventory(@question)
      build_competency_inventory(@question)
      build_options_inventory(@question)
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def download_pdf
    send_file '/assets/data/file.pdf', filename: 'file.pdf', type: 'application/pdf', disposition: 'attachment'
  end

  private

  def build_subject_inventory(question)
    nested_params[:subject_ids].reject!(&:empty?).each do |id|
      subject = Subject.find(id)
      QuestionSubject.create!(subject: subject, question: question)
    end
  end

  def build_competency_inventory(question)
    nested_params[:competency_ids].reject!(&:empty?).each do |id|
      competency = Competency.find(id)
      QuestionCompetency.create!(competency: competency, question: question)
    end
  end

  def build_options_inventory(question)
    nested_params["options_attributes"].each do |_, obj|
      option = Option.new(option: obj["option"], is_correct: obj["is_correct"], question: question)
      option.option_files.attach(obj["option_files"]) if obj["option_files"].present?
      option.save!
    end
  end

  def question_params
    params.require(:question).permit(
      :author, :topic, :grade, :statement, :files_type, :files_id, statement_files: [],
    )
  end


  def nested_params
    params.require(:question).permit(
      question_subjects_attributes: [:subject_id],
      question_competencies_attributes: [:competency_id],
      statement_files: [], # Para arquivos relacionados ao statement
      options_attributes: [:id, :option, :is_correct, option_files: []], # Para arquivos relacionados às options
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
