class TodoList
  def start_button
    {
      selector: 'a[data-testid=start]',
      name: 'Lets Get Started! button'
    }
  end

  def new_item_button
    {
      selector: 'div[data-testid=add-new]',
      name: 'Add New Item button'
    }
  end

  def note_title_field
    {
      selector: 'input[name=note]',
      name: 'note title form field'
    }
  end

  def note_priority_field
    {
      # add your own css selector
      selector: '',
      name: 'note priority form field'
    }
  end

  def save_button
    {
      # add your own css selector
      selector: '',
      name: 'save note button'
    }
  end

  def back_to_list_button
    {
      selector: 'a[data-testid=back-to-list]',
      name: 'back to list button'
    }
  end
end
