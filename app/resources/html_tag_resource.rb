class HtmlTagResource < JSONAPI::Resource
  attributes :name

  has_many :contents
end
