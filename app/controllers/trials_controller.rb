class TrialsController < ApplicationController
  before_action :set_trial, only: [:show, :set_failed, :destroy]
  before_action :ensure_user_subdomain, :authenticate_user!

  # GET /trials
  # GET /trials.json
  def index
    if params[:study_id].nil?
      trials = Trial.all
    else
      trials = Trial.where study_id: params[:study_id]
      @current_best_trial = trials.order("value DESC").first
    end

    unless params[:field].nil? or params[:direction].nil?
      @sorted = params[:field]
      @direction = params[:direction]

      case @sorted
      when 'idx'
        trials.order! trial_id: @direction.to_sym
      when 'num'
        trials.order! number: @direction.to_sym
      when 'study'
        trials.order! study_id: @direction.to_sym
      when 'state'
        trials.order! state: @direction.to_sym
      when 'value'
        trials.order! value: @direction.to_sym
      when 'datetime_start'
        trials.order! datetime_start: @direction.to_sym
      when 'datetime_complete'
        trials.order! datetime_complete: @direction.to_sym
      else
        trials
      end
    end
    @trials = trials
    @study_system_attributes = StudySystemAttribute.all
    @study_user_attributes = StudyUserAttribute.all
  end

  # GET /trials/1
  # GET /trials/1.json
  def show
    @trial_params = TrialParam.where trial_id: @trial.trial_id
    @trial_values = TrialValue.where trial_id: @trial.trial_id
    @trial_system_attributes = TrialSystemAttribute.where trial_id: @trial.trial_id
    @trial_user_attributes = TrialUserAttribute.where trial_id: @trial.trial_id
  end

  def set_failed
    @trial.state = 'FAIL'
    @trial.save
    redirect_to trials_path, notice: 'Trial was successfully modified.'
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial.destroy_sub
    respond_to do |format|
      format.html { redirect_to trials_url, notice: 'Trial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /trials/new
  def new
    @trial = Trial.new
  end

  # POST /trials
  def create
    @trial = Trial.new(trial_params)
    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, notice: 'Trial was successfully created.' }
        format.json { render :show, status: :created, location: @trial }
      else
        format.html { render :new }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
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
