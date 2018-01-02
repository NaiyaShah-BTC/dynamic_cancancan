class ExamsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_permissions

  def index
    @exams = Exam.all
  end

  def new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to exams_path
    else
      redirect_back(fallback_location: new_exam_path)
    end
  end

  def edit
  end

  def update
    @exam = initialize_exam
    if @exam.update_attributes(exam_params)
      redirect_to exams_path
    else
      redirect_back(fallback_location: new_exam_path)
    end
  end

  def destroy
    initialize_exam.destroy
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam).permit(:id, :name, :content)
  end

  def initialize_exam
    Exam.find params[:id]
  end

  def self.permission
    return "Exam"
  end
end
