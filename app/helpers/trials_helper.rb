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

  def trials_download_helper
    if session[:study_id].nil?
      download_trials_path
    else
      download_trials_path study_id: session[:study_id]
    end
  end
end

