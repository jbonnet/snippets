# create_snippet_command
class CreateSnippetCommand

  attr_accessor :title, :body

  def initialize(title: nil, body:, logger:)
    message = "#{self.class.name}.initialize()"
    raise ArgumentError.new('Snippet creation must have a logger') if logger.nil?
    logger.debug(message) {'entered'}
    raise ArgumentError.new('Snippets must have a body') if body.nil?
    @title = title if title
    @body = body
    @logger = logger
  end

  def execute
    message = "#{self.class.name}.execute()"
    @logger.debug(message) {'entered'}
    snippet = Snippet.create(title: @title, body: @body)
    @logger.debug(message) {"snippet with title \"#{@title}\" and body \"#{@body}\" is #{snippet.inspect}"}
    if snippet.save
      @logger.debug(message) {'snippet saved'}
      snippet
    else
      @logger.debug(message) {'snippet NOT saved'}
      nil
    end
  end
end
