class Cost < ActiveRecord::Base
	belongs_to :user
	def self.dashboard
		data = Cost.select("title,sum(money) as num").group("title")
		data.map{|d|[d.title,d.num]}
		#data.map{|d|[Group.find(d.group_id).name,d.total]}
	end
end
