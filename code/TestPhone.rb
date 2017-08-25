module TestPhone
	
	#判断手机号是否有效
	#param: str
	def TestPhone.testPhone(str)
		if str=~/^1[3|4|5|7|8][0-9]{9}$/
			return true
		else
			return false
		end
	end


	#判断邮箱是否有效
	#param: str
	def TestPhone.testEmail(str)
		if str=~/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
			return true
		else
			return false
		end
	end


	#判断手机号是否一致
	#phone1: str
	#phone2: str
	def TestPhone.findSamePhone(phone1, phone2)
		if phone1.strip() == phone2.strip()
			puts true
		else
			puts false
		end
	end


	#判断邮箱是否一致，不区分大小写和空格
	#email1: str
	#email2: str
	def TestPhone.findSameEmail(email1, email2)
		if email1.strip().downcase() == email2.strip().downcase()
			puts true
		else
			puts false
		end
	end

	
end



