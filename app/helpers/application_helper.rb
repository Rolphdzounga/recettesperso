module ApplicationHelper
	def gravatar_for(user,option={size:50})
		gravatar_id = Digest::MD5.hexdigest(user.chefemail.downcase)
		size=option[:size]
		gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url,alt:user.chefnom,class:"img-thumbnail ")
	end
end
