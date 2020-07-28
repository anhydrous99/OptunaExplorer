class TrialsController < ApplicationController
  before_action :set_trial, only: [:show, :destroy]

  # GET /trials
  # GET /trials.json
  def index
    @trials = Trial.all
  end

  # GET /trials/1
  # GET /trials/1.json
  def show
  end

  def list
    study_id = params[:study_id]
    @trials = Trial.where study_id: study_id
    render 'index'
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial.destroy
    respond_to do |format|
      format.html { redirect_to trials_url, notice: 'Trial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial
      @trial = Trial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trial_params
      params.require(:trial).permit(:trial_id, :number, :study_id, :state, :value, :datetime_start, :datetime_complete)
    end
end
