# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all
JoinTableDoctorSpeciality.destroy_all

5.times do 
	City.create!(
		name: Faker::Address.city 
		)
end 

5.times do 
	Patient.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		city_id: rand(City.first.id..City.last.id)
		)
end 

5.times do 
	Doctor.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name, 
		zip_code: Faker::Address.zip_code,
		city_id: rand(City.first.id..City.last.id)
		)
end 

5.times do 
	Speciality.create!(
		name: Faker::Job.field 
		)
end 

5.times do 
	JoinTableDoctorSpeciality.create!(
		speciality_id: rand(Speciality.first.id..Speciality.last.id), 
		doctor_id: rand(Doctor.first.id..Doctor.last.id)
		)
end 

5.times do 
	Appointment.create!(
		date: Faker::Date.forward(days: 30),
		patient_id: rand(Patient.first.id..Patient.last.id), 
		doctor_id: rand(Doctor.first.id..Doctor.last.id),
		city_id: rand(City.first.id..City.last.id)
		)
end 


