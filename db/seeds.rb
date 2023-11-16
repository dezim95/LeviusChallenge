# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?

  Subject.find_or_create_by!(subject_name: "Física")
  Subject.find_or_create_by!(subject_name: "Matemática")
  Subject.find_or_create_by!(subject_name: "Português")
  Subject.find_or_create_by!(subject_name: "Química")
  Subject.find_or_create_by!(subject_name: "Biologia")
  Subject.find_or_create_by!(subject_name: "História")

  Competency.find_or_create_by!(competency_name: "Raciocínio lógico")
  Competency.find_or_create_by!(competency_name: "Interpretação de texto")
  Competency.find_or_create_by!(competency_name: "Conhecimento de fórmulas")
  Competency.find_or_create_by!(competency_name: "Conhecimento de teorias")
  Competency.find_or_create_by!(competency_name: "Conhecimento de regras gramaticais")
  Competency.find_or_create_by!(competency_name: "Habilidades em conta matemática"
  )
end
