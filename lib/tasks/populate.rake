namespace :db do
	desc "Erase and fill db"
	task :populate => :environment do

		puts "STARTING ... "
		Mentor.delete_all

		Mentor.populate 1000 do |mentor|
			mentor.name = Faker::Name.name
			mentor.profession = Faker::Company.profession
			mentor.companyname = Faker::Company.name
			puts "On Record: "+ mentor.id.to_s if mentor.id % 100 == 0 
		end 

		puts "ADDING TAGS.."

		Mentor.all.each do |mentor|
			# 1..rand(10).times { mentor.tag_list.add(Faker::Color.color_name)}
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.save
			puts "On Record: "+mentor.id.to_s if mentor.id % 100 == 0 
		end 
	end

end