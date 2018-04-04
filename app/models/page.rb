require 'uri'
require 'open-uri'

class Page < ApplicationRecord
  has_many :contents, dependent: :destroy
  has_many :html_tags, through: :contents, dependent: :destroy

  validates :url, url: true

  after_create :parse_url

  private

  def parse_url
    document = Nokogiri::HTML(open(url))

    HtmlTag.all.each do |tag|
      document.css(tag.name).each do |node|
        if tag.name == 'a'
          link = URI.join(url, node['href'].to_s).to_s
          contents.build(html_tag: tag, info: link).save
        elsif node.text.strip.present?
          text = node.text.encode!('UTF-8', 'UTF-8', invalid: :replace)
          contents.build(html_tag: tag, info: text.strip).save
        end
      end
    end
  end
end
