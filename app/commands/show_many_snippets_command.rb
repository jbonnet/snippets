# show_many_snippets_command
class ShowManySnippetsCommand
  def initialize(logger:)
    message = "#{self.class.name}.initialize()"
    logger.debug(message) {'entered'}
    @logger = logger
  end

  def execute
    message = "#{self.class.name}.execute()"
    @logger.debug(message) {'entered'}
    Snippet.order(updated_at: :desc)
  end
end
