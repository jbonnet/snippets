# show_many_snippets_command
class ShowManySnippetsCommand
  def initialize
  end

  def execute
    Snippet.order(updated_at: :desc)
  end
end
