require './testPhone'

$Initial_Data_Path = '../data/card_person_new.data'
$File_Number = 10000
module DataProcess
  def self.is_item_valid(item) # 根据电话、邮箱判断是否合法
    testPhone(item['phone']) && testEmail(item['email'])
  end

  def self.hash(str)
    seed = 5381
    result = 0
    str.each_char() do |char|
      # puts(char)
      result = (result * seed + char.ord) % $File_Number
    end
    result
  end

  def self.LoadInitialData(data_path)
    File.open(data_path, 'r') do |file|

    end
    true
  end

end

if __FILE__ == $0
  # item = Hash['name' => 'liyichao', 'phone' => '18201987108',
  #             'email' => 'yclissetj@gmail.com', 'company' => 'IntSig',
  #             'department' => 'Algorithm', 'position' => 'internship']
  # puts(DataProcess.is_item_valid(item))

  puts DataProcess.hash('王大伟 公司')
end
