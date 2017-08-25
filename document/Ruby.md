# Ruby

## 学习内容

###  文件读写

1.   新建文件

2. 写入新数据

     指针直接跳到末尾来插入新数据？

3. 读出数据

### 数据处理

1. 正则检查邮箱、电话格式

## 项目结构

### 数据清洗

```ruby
module DataProcess
  ...
end
```

数据类型：（存储一条数据）

```ruby
item = {name: , phone: , email: , company: , department: , position: }
# 以 Item 代表此数据类型
```

文件数量：

```
File_Number = 10000
```

#### 判断合法性

1. 电话

   长度，前三位（139， 182， …） 

2. 邮箱

```ruby
def DataProcess.is_item_valid(item: Item) # 根据电话、邮箱判断是否合法
  ...
  return true / false
end
```

#### 邮件大小写处理

听说 `ruby`有`String.downcase()`方法 。。

#### 哈希

```ruby
def DataProcess.hash(str: String) # 对字段求 hash 值，并对文件数量(File_Number)求模
  ...
  return hash_value
end
```

#### 初始数据载入

```ruby
def LoadInitialData(data_path)
  ...
  return true / false
end
```

### 文件读写

```ruby
module FileIO
  ..
end
```

目录结构：

```bash
.

├── LICENSE

├── README.md

├── code

	—- FileIO.rb

├── data

	—- name

	—- phone

	—- email

	—- company

	—- department

	—- position

└── document

```

1. 读

   ```ruby
   def FileIO.Read(item: Item) # item 中除了待查找字段，值取 nil
     ...
     return [item1, item2, ...] # 返回查找到的所有 item
   end
   ```

2. 写

   ```ruby
   def FileIO.Write(item: Item)
     ...
     return true / false
   end
   ```

3. 改

   ```ruby
   def FileIO.Modify(item: Item)
     ...
     return true / false
   end
   ```

4. 删

   ```ruby
   def FileIO.Delete(item: Item)
     ...
     return true / false
   end
   ```

### 交互

```ruby
module Interaction
  
end
```