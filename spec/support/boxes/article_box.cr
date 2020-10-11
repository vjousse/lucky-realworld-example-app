class ArticleBox < Avram::Box
  def initialize
    slug "#{sequence("test-slug")}"
    title "Title #{sequence("test-title")}"
    description "Description #{sequence("test-description")}"
    body "Body #{sequence("test-body")}"
    author_id UserBox.create.id
  end
end
