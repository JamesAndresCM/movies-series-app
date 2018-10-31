# frozen_string_literal: true

module SeriesHelper
  def series_links(series)
    if user_signed_in?
      raw("<h5 style='text-align: center;'>") +
        (link_to fa_icon('pencil-square-o', style: 'color: white; margin: 5px'), edit_series_path(series)) +
        (link_to fa_icon('trash'), series, method: :delete, data: { confirm: 'Are you sure?' }, style: 'color: red') +
        raw('</h5>')
      end
  end
end
