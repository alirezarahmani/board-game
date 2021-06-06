class Listener
  def public_send(_event, _play_load)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
