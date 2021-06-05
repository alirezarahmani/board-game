  class Listener
    def public_send(event, play_load)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
