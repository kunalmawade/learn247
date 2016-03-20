# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create!(email: 'admin@learn247.xyz', password: 'admin', role: User::ROLES.index(:Admin))

User.create!(email: 'kunal@learn247.xyz', password: 'kunal', role: User::ROLES.index(:Student))
User.create!(email: 'martin@learn247.xyz', password: 'martin', role: User::ROLES.index(:Student))
User.create!(email: 'subhash@learn247.xyz', password: 'subhash', role: User::ROLES.index(:Student))
User.create!(email: 'yuvraj@learn247.xyz', password: 'yuvraj', role: User::ROLES.index(:Student))

User.create!(email: 'wilson@learn247.xyz', password: 'wilson', role: User::ROLES.index(:Instructor))
User.create!(email: 'johnson@learn247.xyz', password: 'johnson', role: User::ROLES.index(:Instructor))

Course.create!(name: 'Art 101', start_date: "1/4/2016".to_date, end_date: "15/6/2016".to_date, class_average: 0.0, session: Course::SESSIONS.index(:Spring))
Course.create!(name: 'Math 101', start_date: "1/7/2016".to_date, end_date: "25/6/2016".to_date, class_average: 0.0, session: Course::SESSIONS.index(:Summer))
Course.create!(name: 'Physics 101', start_date: "1/4/2016".to_date, end_date: "1/6/2016".to_date, class_average: 0.0, session: Course::SESSIONS.index(:Spring))
Course.create!(name: 'Physics 101', start_date: "1/4/2016".to_date, end_date: "1/6/2016".to_date, class_average: 0.0, session: Course::SESSIONS.index(:Fall))
