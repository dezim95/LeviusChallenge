# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  Subject.destroy_all
  Competency.destroy_all

  6.times do |i|
    Subject.find_or_create_by!(subject_name: "Subject #{i + 1}")
    puts "Created Subject #{i + 1}"
  end

  6.times do |i|
    Competency.find_or_create_by!(competency_name: "Compentency #{i + 1}")
    puts "Created Competency #{i + 1}"
  end
end
