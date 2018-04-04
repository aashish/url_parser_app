class ContentResource < JSONAPI::Resource
  attributes :info, :tag

  has_one :page
  has_one :html_tag

  def tag
    @model.html_tag.name
  end
end
