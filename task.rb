class Task
  attr_reader :id
  @@count = 0

  def initialize(title:, content:)
    @id = @@count += 1
    @title = title
    @content = content
  end

  def info
    "[No.#{@id}] #{@title}:#{@content}"
  end
end
