class PageResource < JSONAPI::Resource
  attribute :website, delegate: :url

  has_many :contents
end
