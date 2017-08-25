$LOAD_PATH << '.'
require 'Index'
require 'TestPhone'
require 'FileIO'
require 'Select'


str=ARGV.join(' ')  
phone=Index.getPhoneFromUrl(str)
email=Index.getEmailFromUrl(str)
action=ARGV.first

item=Index.getItemFromUrl(str)

if action=='count'&&!/^1/.match(phone)
	puts '错误，电话不合法'
end

if phone!='nil'&&!TestPhone.testPhone(phone)
	puts '错误，电话不合法'
end

if email!='nil'&&!TestPhone.testEmail(email)
	puts '错误，邮箱不合法'
end


if action=='select'
	time1=Time.now
	items=Select.select(item)
	time2=Time.now
	puts "#{items}"
	puts time2-time1
elsif action=='delete'
	if item['name']=='nil'
		item['name']==''
	end
	if item['phone']=='nil'
		item['phone']==''
	end
	if item['email']=='nil'
		item['email']==''
	end
	if item['company']=='nil'
		item['company']==''
	end
	if item['department']=='nil'
		item['department']==''
	end
	if item['position']=='nil'
		item['position']==''
	end
	time3=Time.now
	row=FileIO.delete(item['name'],item['phone'],item['email'],item['company'],item['department'],item['position'])
	puts "delete #{row}"
	time4=Time.now
	puts time4-time3
elsif action=='insert'
	time5=Time.now
	FileIO.write(item)
	time6=Time.now
	puts time6-time5
elsif action=='update'
	time7=Time.now
	FileIO.modify(item)
	time8=Time.now
	puts time8-time7
elsif action=='count'
	puts 'count action'
else 
	puts '请输入正确指令'
end