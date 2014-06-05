class Campsite < ActiveRecord::Base
	has_many :reviews

	include PgSearch
	pg_search_scope :search_by_sitename, :against => [:sitename, :nearesttown], :using => {
                    :tsearch => {:prefix => true}
                  }
  pg_search_scope :search_by_state, :against => :state
end
	