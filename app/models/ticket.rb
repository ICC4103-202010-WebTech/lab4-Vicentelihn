class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  # before_xxxxx :update_stats
  before_save :update_stats_saved
  before_destroy :update_stats_destroyed

  private
    def update_stats_saved
      es = self.ticket_type.event.event_stat
      ev = self.ticket_type.event.event_venue
      if es.attendance >= ev.capacity
        raise StandardError.new "Error! the amount of tickets sold for an event surpasses the capacity of the corresponding event venue."
      else
        es.tickets_sold+=1
        es.attendance+=1
        es.save
        #al poner es.save! me sale "cannot find save!" nose si importe, pero lo comento porsiacaso
      end
    end
  end
  private
    def update_stats_destroyed
      es = self.ticket_type.event.event_stat
      es.tickets_sold-=1
      es.attendance-=1
      es.save
    end
  #end
#end
#al igual que mas arriba, lo comento porsiacaso, al poner los ultimo 2 "end" se me marcan en rojo y dice "Unexpected end"