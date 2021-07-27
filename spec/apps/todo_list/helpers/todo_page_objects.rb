class TodoList

  def start_button
    {
      selector: 'a[data-testid=start]',
      name: 'Lets Get Started! button'
    }
  end

  def delete_button
    {
      selector: 'button[data-testid=delete]',
      name: 'Delete Item button'
    }
  end
end
