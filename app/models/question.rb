class Question < ApplicationRecord
  has_one_attached :file
  has_one_attached :statement_file
  has_many_attached :statement_files
  has_many_attached :option_files
  has_many_attached :files
  has_many :options, dependent: :destroy
  has_many :question_subjects
  has_many :subjects, through: :question_subjects
  has_many :question_competencies
  has_many :competencies, through: :question_competencies
  accepts_nested_attributes_for :options, :question_subjects, :question_competencies
  has_rich_text :attribute_name
end
