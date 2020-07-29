class TrialsController < ApplicationController
  before_action :set_trial, only: [:show, :set_failed, :destroy]

  # GET /trials
  # GET /trials.json
  def index
    @trials = Trial.all
  end

  # GET /trials/1
  # GET /trials/1.json
  def show
    @trial_params = TrialParam.where trial_id: @trial.trial_id
    @trial_values = TrialValue.where trial_id: @trial.trial_id
    @trial_system_attributes = TrialSystemAttribute.where trial_id: @trial.trial_id
    @trial_user_attributes = TrialUserAttribute.where trial_id: @trial.trial_id
  end

  def list
    study_id = params[:study_id]
    @trials = Trial.where study_id: study_id
    @study_system_attributes = StudySystemAttribute.where study_id: study_id
    @study_user_attributes = StudyUserAttribute.where study_id: study_id
    render 'trials/index'
  end

  def set_failed
    @trial.state = 'FAIL'
    @trial.save
    redirect_to 'trials/index', notice: 'Trial was successfully modified.'
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    TrialParam.where(trial_id: @trial).destroy_all
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
