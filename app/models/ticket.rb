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
      es.tickets_sold+=1
      es.attendance+=1
    end
  end
  private
    def update_stats_destroyed
      ed = self.ticket_type.event.event_stat
      ed.tickets_sold-=1
      ed.attendance-=1
    end