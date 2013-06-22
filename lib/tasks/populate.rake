namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating user #{n+32} of 42"
      name = Faker::Name.name
      email = "user-#{n+32}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
		
		User.all.each do |user|
			puts "[DEBUG] uploading images for user	#{user.id} of #{User.last.id}"
			42.times do |n|
				image = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
				Name = %w(Bob Mary Chris Steve John Jennifer).sample
				Grade = %w(5.11 5.10 5.9 5.12 5.8).sample
				date = %w(2009 2010 2011 2012 2013).sample
				description = %w(sweet epic awesome killer sick).sample
				user.routes.create!(image: image, Name: Name, Grade: Grade, date: date, description: description)
			end
		end
	end
end