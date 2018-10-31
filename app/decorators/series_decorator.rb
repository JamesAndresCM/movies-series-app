# frozen_string_literal: true

class SeriesDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def serie_capitalize
    category.name.capitalize
  end

  def release
    release_date.strftime('%d/%m/%Y')
  end

  def sanitize(desc)
    h.sanitize(desc, tags: %w[strong em a p b], attributes: %w[href])
  end

  def series_tags
    unless tags.size.zero?
      h.content_tag(:nav, 'aria-label': 'breadcrumb') do
        h.content_tag(:ol, style: 'background-color: black;', class: 'breadcrumb breadcrumb-dot') do
          tags.map do |tag|
            h.content_tag(:li, class: 'breadcrumb-item') do
              h.content_tag(:a, tag.name, style: 'color: white; text-decoration: none', href: '#') do
                tag.name.to_s
              end.html_safe
            end.html_safe
          end.join.html_safe
        end.html_safe
      end
    end
  end

  def serie_type
    type.name
  end

  def serie_count
    videos.count
  end

  def total_videos
    if serie_type.eql?('Serie')
      raw('Chapters ') +
        h.content_tag(:span, class: 'badge badge-pill badge-primary') do
          "#{serie_count}"
        end.html_safe
    end
  end

  def chapters
    if serie_type.eql?('Serie')
      h.content_tag(:div, class:'mt-3 style-chapter') do
      h.content_tag(:h3, style:'padding: 10px; color: white') do
      raw('Chapters')
      end.html_safe
      end.html_safe
    end
  end

  def movie_serie
    serie_type.eql?('Serie') ? 'Chapter' : 'Movie'
  end
end
