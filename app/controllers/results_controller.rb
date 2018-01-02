class ResultsController < ApplicationController
  load_and_authorize_resource

  def index
    @results = Result.all
  end

  def new
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to results_path
    else
      redirect_back(fallback_location: new_result_path)
    end
  end

  def edit
  end

  def update
    @result = initialize_result
    if @result.update_attributes(result_params)
      redirect_to results_path
    else
      redirect_back(fallback_location: new_result_path)
    end
  end

  def destroy
    initialize_result.destroy
    redirect_to results_path
  end

  private

  def result_params
    params.require(:result).permit(:id, :exam_id, :marks)
  end

  def initialize_result
    Result.find params[:id]
  end
end
