class Timesheet < ActiveRecord::Base
  def self.import_from_csv(file)
    CSV.foreach(file.path, headers:true) do |row|
      # you can use row["Service Group"] here to pull out the row
      #  regardless of its position. Cool!
    end
  end
end
