class Timesheet < ActiveRecord::Base
  include UsesFpId

  # Associations
  belongs_to :staff_member
  belongs_to :job

  # Validations
  validates :date,
            :staff_initials,
            :job_name,
            :service,
            :hours,
            presence: true

  # Scopes
  def self.in_sred_year (year)
    where("date >= ?", Date.new(year,8,1)).where("date <= ?", Date.new(year+1,7,31))
  end

  # Callbacks

  # Misc
  attr_accessor :job_number

  def assign_to_staff_member
    self.staff_member = StaffMember.find_by(initials: self.staff_initials)
  end

  def assign_to_job
    self.job = Job.find_by(fp_id: self.job_number) ||
               Job.create(fp_id: self.job_number,
                          name: self.job_name)
  end

  def self.import_from_csv(file)
    # TODO: return more detailed results: success/failure, # rows imported,
    #  rows with errors, etc.
    num_rows_imported = 0
    begin
      CSV.foreach(file.path, headers:true, skip_blanks:true) do |row|
        fp_id = row["Timesheet #"]
        t = Timesheet.find_by(fp_id: fp_id) || Timesheet.new
        t.fp_id           = fp_id
        t.date            = row["Date"]
        t.staff_initials  = row["Staff"]
        t.job_name        = row["Job Name"]
        t.job_number      = row["Job"]
        t.task_name       = row["Task Name"]
        t.service_group   = row["Service Group"]
        t.service         = row["Service"]
        t.description     = row["Description"]
        t.hours           = row["Hours"]

        t.assign_to_staff_member
        t.assign_to_job

        if t.save
          num_rows_imported += 1
        end
      end
    rescue CSV::MalformedCSVError
    end # begin/rescue block
    return num_rows_imported
  end

end
