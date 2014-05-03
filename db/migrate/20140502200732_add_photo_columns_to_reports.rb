class AddPhotoColumnsToReports < ActiveRecord::Migration
  def self.up
   add_attachment :reports, :photo
  end

  def self.down
   remove_attachment :reports, :photo
  end
end
