# create_snippet_command
class CreateSnippetCommand
  def initialize(title: nil, body:, logger:)
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
