class JobsController < ApplicationController

  class JobNotesPresenter
    # TODO: extract this from the controller
    attr_accessor :task_title
    attr_accessor :task_description
    attr_accessor :timesheets

    def initialize(task_title, task_description, timesheets)
      @task_title = task_title
      @task_description = task_description
      @timesheets = timesheets
    end
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    # build up notes
    @notes = []
    orphan_timesheets = @job.timesheets.where("task_name = ''")
    @notes << JobNotesPresenter.new("(No Task)", "", orphan_timesheets)
    @job.tasks.each do |t|
      @notes << JobNotesPresenter.new(t.title, t.description, t.timesheets) if t.timesheets.present?
    end
  end

end
