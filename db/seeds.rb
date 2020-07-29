# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studies_list = [{study_name: 'A2C', direction: 'MAXIMIZE'},
                {study_name: 'noname-study-51684', direction: 'MINIMZE'}]

studies = Study.create studies_list

trials_list = [
    {number: 0, study_id: studies[0].study_id, state: 'COMPLETE', value: 270.88, datetime_start: '2020-07-25 06:05:48', datetime_complete: '2020-07-25 06:29:39'},
    {number: 1, study_id: studies[0].study_id, state: 'COMPLETE', value: 271, datetime_start: '2020-07-25 06:05:48', datetime_complete: '2020-07-25 06:27:47'},
    {number: 2, study_id: studies[0].study_id, state: 'RUNNING', value: nil, datetime_start: '2020-07-25 11:19:21', datetime_complete: nil},
    {number: 3, study_id: studies[1].study_id, state: 'COMPLETE', value: 220, datetime_start: '2020-07-25 06:05:48', datetime_complete: '2020-07-25 06:29:39'},
    {number: 4, study_id: studies[1].study_id, state: 'COMPLETE', value: 222, datetime_start: '2020-07-25 06:05:48', datetime_complete: '2020-07-25 06:27:47'},
    {number: 5, study_id: studies[1].study_id, state: 'RUNNING', value: nil, datetime_start: '2020-07-25 11:19:21', datetime_complete: nil}
]

trials = Trial.create trials_list

trial_params_list = [
    {trial_id: trials[0].trial_id, param_name: 'n_steps', param_value: 3, distribution_json: '{"name": "CategoricalDistribution", "attributes": {"choices": [32, 64, 128, 256, 512, 1024, 2048]}}'},
    {trial_id: trials[1].trial_id, param_name: 'n_steps', param_value: 5, distribution_json: '{"name": "CategoricalDistribution", "attributes": {"choices": [32, 64, 128, 256, 512, 1024, 2048]}}'},
    {trial_id: trials[0].trial_id, param_name: 'nminibatches', param_value: 0, distribution_json: '{"name": "CategoricalDistribution", "attributes": {"choices": [1, 4, 8, 32, 64, 128]}}'},
    {trial_id: trials[1].trial_id, param_name: 'nminibatches', param_value: 0, distribution_json: '{"name": "CategoricalDistribution", "attributes": {"choices": [1, 4, 8, 32, 64, 128]}}'},
    {trial_id: trials[0].trial_id, param_name: 'lam', param_value: 0.926422, distribution_json: '{"name": "UniformDistribution", "attributes": {"low": 0.8, "high": 0.95}}'},
    {trial_id: trials[1].trial_id, param_name: 'lam', param_value: 0.826022, distribution_json: '{"name": "UniformDistribution", "attributes": {"low": 0.8, "high": 0.95}}'},
    {trial_id: trials[0].trial_id, param_name: 'learning_rate', param_value: 0.000822166, distribution_json: '{"name": "LogUniformDistribution", "attributes": {"low": 0.0003, "high": 0.001}}'},
    {trial_id: trials[1].trial_id, param_name: 'learning_rate', param_value: 0.000982609, distribution_json: '{"name": "LogUniformDistribution", "attributes": {"low": 0.0003, "high": 0.001}}'}
]

trial_params = TrialParam.create trial_params_list
