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

trials_list = [
    [0, 1, 'COMPLETE', 270.88, '2020-07-25 06:05:48', '2020-07-25 06:29:39'],
    [1, 1, 'COMPLETE', 271, '2020-07-25 06:05:48', '2020-07-25 06:27:47'],
    [2, 1, 'RUNNING', nil, '2020-07-25 11:19:21', nil],
    [3, 2, 'COMPLETE', 220, '2020-07-25 06:05:48', '2020-07-25 06:29:39'],
    [4, 2, 'COMPLETE', 222, '2020-07-25 06:05:48', '2020-07-25 06:27:47'],
    [5, 2, 'RUNNING', nil, '2020-07-25 11:19:21', nil]
]

studies_list.each { |study_name, direction| Study.create study_name: study_name, direction: direction }

trials_list.each do |number, study_id, state, value, datetime_start, datetime_complete|
  Trial.create number: number, study_id: study_id, state: state, value: value, datetime_start: datetime_start,
               datetime_complete: datetime_complete
end
