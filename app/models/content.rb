class Content < ApplicationRecord
  belongs_to :page
  belongs_to :html_tag

  validates :info, presence: true

 end
