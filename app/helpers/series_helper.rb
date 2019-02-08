# frozen_string_literal: true

module SeriesHelper
  def series_links(series)
    if user_signed_in?
      raw("<h5 style='text-align: center;'>") +
        (link_to fa_icon('pencil-square-o', style: 'color: white; margin: 5px'), edit_series_path(get_slug(series))) +
        (link_to fa_icon('trash'), series_path(get_slug(series)), method: :delete, data: { confirm: 'Are you sure?' }, style: 'color: red') +
        raw('</h5>')
      end
  end

  def get_slug(series)
    series.is_a?(Series) ? series : series.id 
  end
end
