module Index
	str=ARGV.join(' ')  
	def Index.getNameFromUrl(argvString)
		if pattern=/\(name=(.*?)\)/i.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getPhoneFromUrl(argvString)
		if pattern=/\(phone=(.*?)\)/i.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getEmailFromUrl(argvString)
		if pattern=/\(email=(.*?)\)/.match(argvString)
			return pattern[1]
		else
			return 'nil'
		end
	end

	def Index.getCompanyFromUrl(argvString)
		if pattern=/\(company=(.*?)\)/i.match(argvString)
			return pattern[1]	
		else
			return 'nil'
		end
	end

	def Index.getDepartmentFromUrl(argvString)
		if pattern=/\(department=(.*?)\)/i.match(argvString)
			return pattern[1]	
		else
			return 'nil'
		end
	end

	def Index.getPositionFromUrl(argvString)
		if pattern=/\(position=(.*?)\)/i.match(argvString)
			return pattern[1]
		else
			return 'nil'	
		end
	end

	def Index.getItemFromUrl(argvString)
		item={'name'=>getNameFromUrl(argvString),'phone'=>getPhoneFromUrl(argvString),'email'=>getEmailFromUrl(argvString),'company'=>getCompanyFromUrl(argvString),'department'=>getDepartmentFromUrl(argvString),'position'=>getPositionFromUrl(argvString)}
		return item
	end

	def Index.getAndOr(argvString)
		if pattern=/.*and.*/i.match(argvString)
			return 'and'
		elsif pattern2=/.*or.*/i.match(argvString)
			return 'or'
		end
	end

	def Index.attributeToBeSet(argvString)
		if pattern=/.*set(.*?)/i.match(argvString)
			return pattern[1]
		end
	end
end