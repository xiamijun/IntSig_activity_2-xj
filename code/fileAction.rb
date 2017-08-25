# f=open('file.txt','a')
# f.puts 'first line'
# f.puts 'second line'
# f.puts 'third line'

#读取文件
def readFile(str)
	File.open(str,"r") do |file|
	   while line  = file.gets
	       puts line #打印出文件内容
	   end
	end
end
