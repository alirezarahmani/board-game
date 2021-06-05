require_relative '../Events/Publisher'
class Room

  def initialize
    @event = Publisher.new
  end

  def event
     @event
  end

  def question
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @return [Hash]
  def actions
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @return [Void]
  def player_reaction(action)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
