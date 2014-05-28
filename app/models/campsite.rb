class Campsite < ActiveRecord::Base
	include PgSearch
	pg_search_scope :search_by_sitename, :against => [:sitename, :nearesttown], :using => {
                    :tsearch => {:prefix => true}
                  }
end
	