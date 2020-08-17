module TrialsHelper
  def get_to_sort(field, to_sort, direction)
    if !field.nil? and field == to_sort
      if direction.nil? or direction == 'desc'
        content_tag :a, '', class: 'text-dark fas fa-sort-down', href: trials_path(field: field, direction: :asc), id: "#{field}-sort"
      elsif direction == 'asc'
        content_tag :a, '', class: 'text-dark fas fa-sort-up', href: trials_path(field: field, direction: :desc), id: "#{field}-sort"
      end
    else
      content_tag :a, '', class: 'text-dark fas fa-sort', href: trials_path(field: field, direction: :desc), id: "#{field}-sort"
    end
  end
end

