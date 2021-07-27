class TodoActions
  include Capybara::DSL

  def find_row(text)
    page.find('tr', text: text)
  end

  def delete_row_item(row)
    row.find()
end
  