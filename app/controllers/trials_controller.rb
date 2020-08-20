class TrialsController < ApplicationController
  before_action :set_trial, only: [:show, :set_failed, :destroy]
  before_action :ensure_user_subdomain, :authenticate_user!
  helper_method :trials_path_helper, :trials_url_helper

  # GET /trials
  # GET /trials.json
  def index
    if params[:study_id].nil?
      trials = Trial.all
      session.delete(:study_id)
    else
      session[:study_id] = params[:study_id]
      trials = Trial.where study_id: params[:study_id]
      @current_best_trial = trials.order("value DESC").first
    end

    unless params[:field].nil? or params[:direction].nil?
      @sorted = params[:field]
      @direction = params[:direction]

      case @sorted
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
    notice = 'Trial was successfully modified.'
    redirect_to trials_path_helper, notice: notice
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial.destroy_sub
    notice = 'Trial was successfully destroyed.'
    redirect_to trials_url_helper, notice: notice
  end

  # GET /trials/new
  def new
    @trial = Trial.new
  end

  # POST /trials
  def create
    @trial = Trial.new(trial_params)
    if @trial.save
      notice = 'Trial was successfully created.'
      redirect_to trials_path_helper, notice: notice
    else
      render :new
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

  def trials_path_helper
    if session[:study_id].nil?
      trials_path
    else
      trials_path(study_id: session[:study_id])
    end
  end

  def trials_url_helper
    if session[:study_id].nil?
      trials_url
    else
      trials_url(study_id: session[:study_id])
    end
  end
end
