class RenameCompanyNameInMentors < ActiveRecord::Migration
  def change
  	rename_column :mentors, :companyName, :companyname
  end
end
