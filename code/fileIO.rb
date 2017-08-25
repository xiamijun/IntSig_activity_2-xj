#!/usr/bin/ruby -w
require 'pathname'

$File_Number = 10000

module FileIO
    def self.hash(str)
        seed = 5381
        result = 0
        str.each_char() do |char|
            result = (result * seed + char.ord) % $File_Number
        end
        result
    end
    def self.write(item)#将Hash item写入文件

        #获取字段的文件路径
        parentPath =  File.expand_path("..",Dir.pwd)
        namePath = "/data/name/"
        phonePath ="/data/phone/"
        emailPath = "/data/email/"
        companyPath = "/data/company/"
        departmentPath = "/data/department/"
        positionPath = "/data/position/"


        #获取字段的值
        name = "#{item['name']}"
        phone = "#{item['phone']}"
        email = "#{item['email']}"
        company = "#{item['company']}"
        department = "#{item['department']}"
        position = "#{item['position']}"

        #获取字段hash
        hashName = hash(name);
        hashPhone = hash(phone);
        hashEmail = hash(email.downcase());
        hashCompany = hash(company);
        hashDepartment = hash(department);
        hashPosition = hash(position);

        #将数据分别插入到其中
        writeFile("#{parentPath+namePath+hashName.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+phonePath+hashPhone.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+emailPath+hashEmail.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+companyPath+hashCompany.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+departmentPath+hashDepartment.to_s}",name,phone,email,company,department,position);
        writeFile("#{parentPath+positionPath+hashPosition.to_s}",name,phone,email,company,department,position);
        
    end
    
    
    def self.writeFile(filePath,name,phone,email,company,department,position)#实现将数据插入
        file = File.open("#{filePath}","a+")
        if file
            file.syswrite("#{name}!-!#{phone}!-!#{email}!-!#{company}!-!#{department}!-!#{position}\n")#每个字段的值以 !-!分开
            else
            puts "Unable to open file!"
        end
        file.close()
    end


  def self.delete(name,phone,email,company,department,position)

      parentPath =  File.expand_path("..",Dir.pwd)
      namePath = "/data/name/"
      phonePath ="/data/phone/"
      emailPath = "/data/email/"
      companyPath = "/data/company/"
      departmentPath = "/data/department/"
      positionPath = "/data/position/"


      #获取字段hash
      hashName = hash(name);
      hashPhone = hash(phone);
      hashEmail = hash(email.downcase());
      hashCompany = hash(company);
      hashDepartment = hash(department);
      hashPosition = hash(position);


    nameFilePath = parentPath+namePath
    phoneFilePath = parentPath+phonePath
    emailFilePath = parentPath+emailPath
    companyFilePath = parentPath+companyPath
    departmentFilePath = parentPath+departmentPath
    positionFilePath = parentPath+positionPath

    if File.exist?(nameFilePath)
        number = deleteDataAndWrite(nameFilePath+hashName.to_s,phoneFilePath,emailFilePath,companyFilePath,departmentFilePath,positionFilePath,name,phone,email,company,department,position,1)
        return number
    end
      if File.exist?(phoneFilePath)
         number =  deleteDataAndWrite(phoneFilePath+hashPhone.to_s,nameFilePath,emailFilePath,companyFilePath,departmentFilePath,positionFilePath,name,phone,email,company,department,position,2)
          return number
      end
      if File.exist?(emailFilePath)
          number =  deleteDataAndWrite(emailFilePath+hashEmail.to_s,nameFilePath,phoneFilePath,companyFilePath,departmentFilePath,positionFilePath,name,phone,email,company,department,position,3)
          return number
      end
     if File.exist?(companyFilePath)
         number =  deleteDataAndWrite(companyFilePath+hashCompany.to_s,nameFilePath,phoneFilePath,emailFilePath,departmentFilePath,positionFilePath,name,phone,email,company,department,position,4)
         return number
     end
      if File.exist?(departmentFilePath)
          number =  deleteDataAndWrite(departmentFilePath+hashDepartment.to_s,nameFilePath,phoneFilePath,emailFilePath,companyFilePath,positionFilePath,name,phone,email,company,department,position,5)
          return number
      end
      if File.exist?(positionFilePath)
          number = deleteDataAndWrite(positionFilePath+hashPosition.to_s,nameFilePath,phoneFilePath,emailFilePath,companyFilePath,departmentFilePath,name,phone,email,company,department,position,6)
          return number
      end
    return 0
  end

  def self.deleteDataAndWrite(filePath,filePath1,filePath2,filePath3,filePath4,filePath5,name,phone,email,company,department,position,index)
      if File.exist?filePath
          arr = IO.readlines(filePath)
          size = arr.length
          i = 0
          originArrays = Array.new
          matchArrays = Array.new
          while i < size  do
              originArrays.push(i)
              i = i + 1
          end
          i = 0;
          while i < size  do
              line = arr.at(i);

              arrays = line.split("!-!")
              getName =  "nil"
              getPhone =  "nil"
              getEmail = "nil"
              getCompany = "nil"
              getDepartment = "nil"
              getPosition = "nil"


              getNamebefore = arrays.at(0)
              if !getNamebefore.nil?
                  getName = arrays.at(0)
              end

              getPhoneBefore = arrays.at(1)
              if !getPhoneBefore.nil?
                  getPhone = arrays.at(1)
              end

              getEmailBefore = arrays.at(2)
              if !getEmailBefore.nil?
                  getEmail = arrays.at(2)
              end

              getCompanyBefore = arrays.at(3)
              if !getCompanyBefore.nil?
                  getCompany = arrays.at(3)
              end

              getDepartmentBefore = arrays.at(4)
              if !getDepartmentBefore.nil?
                  getDepartment = arrays.at(4)
              end

              getPositionBefore = arrays.at(5)
              if !getPositionBefore.nil?
                  getPosition = arrays.at(5).chomp
              end

              delete = 1
              if !name.empty? && name!=getName
                      delete = 0
              end

              if delete==1 && !phone.empty? && phone != getPhone
                  delete = 0
              end


              if delete==1 && !email.empty? && email != getEmail
                  delete = 0
              end

              if delete==1 && !company.empty? && company != getCompany
                  delete = 0
              end

              if delete==1 && !department.empty? && department != getDepartment
                  delete = 0
              end

              if delete==1 && !position.empty? && position != getPosition
                  delete = 0
              end

              if delete==1

                  matchArrays << i

                  if index == 1

                      phonePath = filePath1 + hash(getPhone).to_s
                      deleteOtherFile(phonePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      emailPath = filePath2 + hash(getEmail).to_s
                      deleteOtherFile(emailPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      companyPath = filePath3 + hash(getCompany).to_s
                      deleteOtherFile(companyPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      departmentPath = filePath4 + hash(getDepartment).to_s
                      deleteOtherFile(departmentPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      positionPath = filePath5 + hash(getPosition).to_s
                      deleteOtherFile(positionPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                  end

                  if index == 2
                      namePath = filePath1 + hash(getName).to_s
                      deleteOtherFile(namePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      emailPath = filePath2 + hash(getEmail).to_s
                      deleteOtherFile(emailPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      companyPath = filePath3 + hash(getCompany).to_s
                      deleteOtherFile(companyPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      departmentPath = filePath4 + hash(getDepartment).to_s
                      deleteOtherFile(departmentPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      positionPath = filePath5 + hash(getPosition).to_s
                      deleteOtherFile(positionPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                  end

                  if index == 3

                      namePath = filePath1 + hash(getName).to_s
                      deleteOtherFile(namePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      phonePath = filePath2 + hash(getPhone).to_s
                      deleteOtherFile(phonePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      companyPath = filePath3 + hash(getCompany).to_s
                      deleteOtherFile(companyPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      departmentPath = filePath4 + hash(getDepartment).to_s
                      deleteOtherFile(departmentPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      positionPath = filePath5 + hash(getPosition).to_s
                      deleteOtherFile(positionPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)
                  end

                  if index == 4


                      namePath = filePath1 + hash(getName).to_s
                      deleteOtherFile(namePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      phonePath = filePath2 + hash(getPhone).to_s
                      deleteOtherFile(phonePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      emailPath = filePath3 + hash(getEmail).to_s
                      deleteOtherFile(emailPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      departmentPath = filePath4 + hash(getDepartment).to_s
                      deleteOtherFile(departmentPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      positionPath = filePath5 + hash(getPosition).to_s
                      deleteOtherFile(positionPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                  end

                  if index == 5

                      namePath = filePath1 + hash(getName).to_s
                      deleteOtherFile(namePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      phonePath = filePath2 + hash(getPhone).to_s
                      deleteOtherFile(phonePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      emailPath = filePath3 + hash(getEmail).to_s
                      deleteOtherFile(emailPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      companyPath = filePath4 + hash(getCompany).to_s
                      deleteOtherFile(companyPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      positionPath = filePath5 + hash(getPosition).to_s
                      deleteOtherFile(positionPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                  end

                  if index == 6
                      namePath = filePath1 + hash(getName).to_s
                      deleteOtherFile(namePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      phonePath = filePath2 + hash(getPhone).to_s
                      deleteOtherFile(phonePath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)


                      emailPath = filePath3 + hash(getEmail).to_s
                      deleteOtherFile(emailPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      companyPath = filePath4 + hash(getCompany).to_s
                      deleteOtherFile(companyPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)

                      departmentPath = filePath5 + hash(getDepartment).to_s
                      deleteOtherFile(departmentPath,getName,getPhone,getEmail,getCompany,getDepartment,getPosition)
                  end


              end

              i = i + 1;
          end


          newArrays = originArrays - matchArrays
          filenow = File.open(filePath,"w")
          newArrays.each{
              |k|
              line = arr.at(k)
              filenow.syswrite(line)
          }
          filenow.close
          return matchArrays.length
      else
        return 0
      end
      end

   def self.deleteOtherFile(filePath,name,phone,email,company,department,position)

       linearrays = IO.readlines(filePath)

     i = 0;
     size = linearrays.length
     matchPosArray = Array.new
       originArray = Array.new
       while i < size  do
           originArray << i
           i = i + 1
       end
       i = 0;
       while i < size  do
           line = linearrays.at(i);
           arrays = line.split("!-!")
           getName =  "nil"
           getPhone =  "nil"
           getEmail = "nil"
           getCompany = "nil"
           getDepartment = "nil"
           getPosition = "nil"
           getNamebefore = arrays.at(0)
           if !getNamebefore.nil?
               getName = arrays.at(0)
           end

           getPhoneBefore = arrays.at(1)
           if !getPhoneBefore.nil?
               getPhone = arrays.at(1)
           end

           getEmailBefore = arrays.at(2)
           if !getEmailBefore.nil?
               getEmail = arrays.at(2)
           end

           getCompanyBefore = arrays.at(3)
           if !getCompanyBefore.nil?
               getCompany = arrays.at(3)
           end

           getDepartmentBefore = arrays.at(4)
           if !getDepartmentBefore.nil?
               getDepartment = arrays.at(4)
           end

           getPositionBefore = arrays.at(5)
           if !getPositionBefore.nil?
               getPosition = arrays.at(5).chomp
           end
           if getName==name&&getPhone==phone&&getEmail==email&&getCompany==company&&getDepartment==department&&getPosition==position
               matchPosArray << i
           end
           i = i + 1;
       end
       newArray = originArray - matchPosArray
       file = File.open(filePath,"w");
       newArray.each{
           |k|
           file.syswrite(linearrays.at(k))
       }
       file.close
  end

  def self.insert
      item1 = Hash['name' => 'wangpeiyu', 'phone' => '15111929296',
                   'email' => '3285840393@qq.com', 'company' => 'IntSig',
                   'department' => 'Algorithm', 'position' => 'internship']

      item2 = Hash['name' => 'baidu', 'phone' => '18201987234',
                   'email' => '472979382@gmail.com', 'company' => 'IntSig',
                   'department' => 'Algorithm', 'position' => 'internship']

      item3 = Hash['name' => 'yahoo', 'phone' => '15901987108',
                   'email' => '08438543@gmail.com', 'company' => 'IntSig',
                   'department' => 'Algorithm', 'position' => 'internship']

      item4 = Hash['name' => 'alibaba', 'phone' => '15901987108',
                   'email' => 'fafagjag@gmail.com', 'company' => 'IntSig',
                   'department' => 'Algorithm', 'position' => 'internship']
      write(item1)
      write(item2)
      write(item3)
      write(item4)
  end
end

if __FILE__ == $0
 puts  FileIO.delete("baidu","","","","","")
 # FileIO.insert
end

