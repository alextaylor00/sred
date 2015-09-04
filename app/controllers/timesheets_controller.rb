class TimesheetsController < ApplicationController

  def index
    @timesheets = Timesheet.all
  end

  def show
    @timesheet = Timesheet.find_by(fp_id: params[:fp_id])
  end

  def import
    csv_file = params[:file]
    Timesheet.import_from_csv(csv_file)
    redirect_to timesheets_path
  end
end
