# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studies_list = [
    ['A2C', 'MAXIMIZE'],
    ['noname-study-85168163', 'MINIMIZE']
]

studies_list.each { |study_name, direction| Study.create(study_name: study_name, direction: direction) }
