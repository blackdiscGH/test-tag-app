namespace :db do
	desc "Erase and fill db"
	task :populate => :environment do
		Mentor.delete_all

		Mentor.populate 50 do |mentor|
			mentor.name = Faker::Name.name
			mentor.profession = Faker::Company.profession
			mentor.companyname = Faker::Company.name
		end 
		Mentor.all.each do |mentor|
			# 1..rand(10).times { mentor.tag_list.add(Faker::Color.color_name)}
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.tag_list.add(Faker::Color.color_name)
			mentor.save
		end 
	end

end