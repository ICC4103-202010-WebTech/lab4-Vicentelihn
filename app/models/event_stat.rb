class EventStat < ApplicationRecord
  belongs_to :event

  before_save :exceed_ticket_capacity

  private
    def exceed_ticket_capacity
      if EventVenue.capacity < Ticket.ticket_type.order
        throw :abort
    end
  end
end