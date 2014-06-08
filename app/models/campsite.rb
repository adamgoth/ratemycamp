class Campsite < ActiveRecord::Base	
	include PgSearch
	pg_search_scope :search_by_sitename, :against => [:sitename, :nearesttown], :using => {
                    :tsearch => {:prefix => true}
                  }
 	pg_search_scope :search_by_state, :against => :state

 	has_many :reviews

end
	