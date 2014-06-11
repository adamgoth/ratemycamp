class PagesController < ApplicationController
	def home
		@campsites = Campsite.all
		@recent_reviews = Review.find(:all, :order => "id desc", :limit => 5)
		@highest_rated_campsites = Campsite.find_by_sql "SELECT *
														                          FROM (
														                            SELECT distinct c.id
														                              , c.sitename
														                              , round(avg(r.rating), 2) as average  
														                            FROM campsites c
														                              , reviews r
														                            WHERE c.id = r.campsite_id
														                            GROUP BY c.id, c.sitename
														                            )x
														                          ORDER BY x.average DESC
														                          LIMIT 5"
  end
end
