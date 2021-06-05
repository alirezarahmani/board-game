require_relative 'Event'
require_relative 'PlayerListener'
class Publisher < Event
    def dispatch(event, *payload)
      PlayerListener.new.public_send(event.to_sym, *payload)
    end
end

