module CampsitesHelper
	def us_states
    [
    	['', ''],
      ['Alabama', 'Alabama'],
      ['Alaska', 'Alaska'],
      ['Arizona', 'Arizona'],
      ['Arkansas', 'Arkansas'],
      ['California', 'California'],
      ['Colorado', 'Colorado'],
      ['Connecticut', 'Connecticut'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'Illinois'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
	end

  def us_states_distinct
    Campsite.uniq.pluck(:state).sort
  end

  def most_recent_reviews
    Review.find(:all, :order => "id desc", :limit => 5)
  end

  def highest_rated_campsites
    Campsite.find_by_sql "SELECT *
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
