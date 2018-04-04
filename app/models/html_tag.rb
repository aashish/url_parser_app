class HtmlTag < ApplicationRecord
  has_many :contents, dependent: :destroy
  has_many :pages, through: :contents, dependent: :destroy

  validates_uniqueness_of :name
end
