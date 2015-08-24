class TasksController < ApplicationController
  def index
    @timesheets = Timesheet.all
  end

  def import
    csv_file = params[:file]
    Task.import_from_csv(csv_file)
    redirect_to tasks_path
  end

end
