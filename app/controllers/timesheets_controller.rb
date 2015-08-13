class TimesheetsController < ApplicationController
  def import
    csv_file = params[:file]
    Timesheet.import_from_csv(csv_file)
  end
end
