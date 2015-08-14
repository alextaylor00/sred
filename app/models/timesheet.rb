class Timesheet < ActiveRecord::Base
  validates :date,
            :staff,
            :job_name,
            :service,
            :hours,
            presence: true

  def self.import_from_csv(file)
    # TODO: return more detailed results: success/failure, # rows imported,
    #  rows with errors, etc.
    num_rows_imported = 0
    begin
      CSV.foreach(file.path, headers:true, skip_blanks:true) do |row|
        fp_id = row["Timesheet #"]
        t = Timesheet.find_by(fp_id: fp_id) || Timesheet.new
        t.fp_id         = fp_id
        t.date          = row["Date"]
        t.staff         = row["Staff"]
        t.job_name      = row["Job Name"]
        t.task_name     = row["Task Name"]
        t.service_group = row["Service Group"]
        t.service       = row["Service"]
        t.description   = row["Description"]
        t.hours         = row["Hours"]
        if t.save
          num_rows_imported += 1
        end
      end
    rescue CSV::MalformedCSVError
    end # begin/rescue block
    return num_rows_imported
  end

end
