# create_snippet_command
class CreateSnippetCommand

  attr_accessor :title, :body

  def initialize(title: nil, body:, logger:)
    message = "#{self.class.name}.initialize()"
    logger.debug(message) {'entered'}
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
