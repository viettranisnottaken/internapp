class JobsController < ApplicationController
  def index
    @page = (params[:page] || 0).to_i
    @jobs = Job.offset(5 * @page).limit(5)
    @per_page = @jobs.count
  end
end
