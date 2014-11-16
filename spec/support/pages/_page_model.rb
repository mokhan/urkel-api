class PageModel
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  attr_reader :page_path

  def initialize(page_path)
    @page_path = page_path
  end

  def visit_page
    visit page_path
    self
  end

  def on_page?
    current_path == page_path
  end

  def has_error?(translation_key)
    page.has_content?(translate(translation_key))
  end

  def translate(key)
    I18n.translate(key)
  end
end
