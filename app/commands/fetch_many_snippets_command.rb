# fetch_many_snippets_command
class FetchManySnippetsCommand
  def initialize(logger:)
    message = "#{self.class.name}.initialize()"
    raise ArgumentError.new('Snippet fetching must have a logger') if logger.nil?
    logger.debug(message) {'entered'}
    @logger = logger
  end

  def execute
    message = "#{self.class.name}.execute()"
    @logger.debug(message) {'entered'}
    Snippet.order(updated_at: :desc)
  end
end
