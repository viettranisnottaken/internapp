class CvsController < ApplicationController
  def new
    @cv = current_user.cvs.build
  end

  def create
    @cv = current_user.cvs.build(cv_params)
    if @cv.save
      redirect_to @cv.user
      flash[:success] = "CV uploaded"
    else
      redirect_to action: :new
      flash[:danger] = "Is your file a PDF and smaller than 10MB?"
    end
  end

  def destroy
    #code
  end

  private

  def cv_params
    params.require(:cv).permit(:filename)
  end
end
