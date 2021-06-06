require_relative '../Events/Publisher'
class Room
  attr_reader :event

  def initialize
    @event = Publisher.new
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
