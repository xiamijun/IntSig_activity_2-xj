require './DataProcess'
require './FileIO'
$LOAD_PATH << '.'
require "./Index"
require  'find'

module Select
  
  
  

#ITEMS2 = {"name" => "zhangsan", "phone" => "188"}



def Select.select(item)
  params = {"name" => 0,"phone" => 1 , "email" =>2, "company" => 3 , "department" => 4 , "position" => 5}
  # 取到用户输入数据
   str = ARGV.join(' ')
   # item = Index.getItemFromUrl(str)
   andOr = Index.getAndOr(str)
# item = {"name" => "alibaba", "phone" => "15901987108"}

  # 对字段求 hash 值，并对文件数量(File_Number)求模
   hash_key_val = Hash.new
   item.each do |key, value|
     if value.to_s != 'nil'
      if key.to_s == 'email'
        value = value.downcase().to_s
      end
       hash_key_val[key.to_s] = DataProcess.hash(value.to_s)
     end
   end

length = hash_key_val.length

parentPath =  File.expand_path("..",Dir.pwd)
resultname = parentPath + '/result'
writeResult(resultname, '')

  #打开文件夹，查找对应的文件
   hash_key_val.each do |key, value|
     filename = parentPath + "/data/" + key.to_s + '/'
     Find.find(filename) do |eachFile|
       hash_val = filename + value.to_s
       if File.exists?(hash_val)
         #读取文件内容，遍历出符合条件的结果
         IO.foreach(hash_val) do |line|
           #puts line if line =~/"#{ITEMS2["name"]}"/ #输出匹配到了'abc'的所在行
           a = line.split('!-!')
           if item[key.to_s].downcase().to_s == a[params[key.to_s]].downcase().to_s
             if length == 1 or andOr == 'or'
                puts line
             else
               writeResult(resultname, line)
             end
             next
           end
           end
       else
         puts "Do not exist!"
         return
       end
     end
   end

  if length > 1
    wa = 0

      IO.foreach(resultname) do |line|
        wa=0
        res = line.split('!-!')
        hash_key_val.each do |key, value|
          if item[key.to_s].to_s == res[params[key.to_s]].to_s
            wa = wa+1
          end

        end
        if wa == length
          puts line
        end
      end
  end


end


def Select.writeResult(filePath,line)
  if line == ''
  file = File.open("#{filePath}","w")
  else
    file = File.open("#{filePath}","a+")
  end
  if file
    file.syswrite("#{line}\n")
    else
    puts "Unable to open file!"
    end
    file.close()
    end

end