module TrialsHelper
  def get_to_sort(field, to_sort, direction)
    id = "#{field}-sort"
    if !field.nil? and field == to_sort
      class_txt = 'text-dark fas fa-sort-down'
      if direction.nil? or direction == 'desc'
        if session[:study_id].nil?
          content_tag :a, '', class: class_txt, href: trials_path(field: field, direction: :asc), id: id
        else
          content_tag :a, '', class: class_txt, href: trials_path(field: field, direction: :asc, study_id: session[:study_id]), id: id
        end
      elsif direction == 'asc'
        if session[:study_id].nil?
          content_tag :a, '', class: 'text-dark fas fa-sort-up', href: trials_path(field: field, direction: :desc), id: id
        else
          content_tag :a, '', class: 'text-dark fas fa-sort-up', href: trials_path(field: field, direction: :desc, study_id: session[:study_id]), id: id
        end
      end
    else
      if session[:study_id].nil?
        content_tag :a, '', class: 'text-dark fas fa-sort', href: trials_path(field: field, direction: :desc), id: id
      else
        content_tag :a, '', class: 'text-dark fas fa-sort', href: trials_path(field: field, direction: :desc, study_id: session[:study_id]), id: id
      end
    end
  end

  def trials_download_helper(json=false)
    if session[:study_id].nil?
      if json
        download_trials_path json: true, format: 'json'
      else
        download_trials_path json: false, format: 'csv'
      end
    else
      if json
        download_trials_path json: true, study_id: session[:study_id], format: 'json'
      else
        download_trials_path json: false, study_id: session[:study_id], format: 'csv'
      end
    end
  end
end

