class Task < ActiveRecord::Base
  # Associations
  belongs_to :job

  # Validations
  validates :fp_id,
            :title,
            presence: true

  # Scopes


  # Callbacks

  # Misc
  attr_accessor :job_number

  def assign_to_job
    self.job = Job.find_by(fp_id: self.job_number)
  end

  def self.import_from_csv(file)
    num_rows_imported = 0
    begin
      CSV.foreach(file.path, headers:true, skip_blanks:true) do |row|
        fp_id = row["Task #"]
        t = Task.find_by(fp_id: fp_id) || Task.new
        t.fp_id            = fp_id
        t.title            = row["Task Title"]
        t.description      = row["Description"]
        t.job_number       = row["Job Number"]

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
