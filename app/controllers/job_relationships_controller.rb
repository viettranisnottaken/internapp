class JobRelationshipsController < ApplicationController
  def create
    # byebug
    job_relationship = JobRelationship.new(cv_id: params[:cv_id], job_id: params[:job][:job_id])
    if job_relationship.save
      redirect_to users_path
      flash[:success] = "Job attached to CV"
    else
      redirect_to users_path
      flash[:danger] = "Only 1 job allowed per CV"
    end
  end
end
