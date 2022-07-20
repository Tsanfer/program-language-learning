---@diagnostic disable: assign-type-mismatch
-- 单行注释
--[[
  多行注释
  多行注释
]]

print("a" .. "b") -- 字符串连接
print(123 .. 456)
print(123 + 456)
print(#"WHOMAI") -- 长度
local tb = { "one", "two", three = 3 }
print("tb[1]: ", tb[1])
tb["four"] = "四" -- 向 table 中插入键值对
print("tb.four: ", tb.four) -- 当索引为字符串类型时的一种简化写法
print('tb["four"]: ', tb["four"])
print("ipairs: ")
for key, val in ipairs(tb) do -- int pairs，遍历整数不连续时，就会停止遍历
  print(key, val)
end
print("pairs: ")
for key, val in pairs(tb) do -- pairs，table 中的所有元素都遍历
  print(key, val)
end

local function average(avg, ...)
  result = 0
  print(avg)
  local arg = { ... } --> arg 为一个表，局部变量
  for i, v in ipairs(arg) do
    result = result + v
  end
  print("个数为: ", #{ ... })
  return result / #arg
end

print("平均值为: ", average("average: ", 0, 5, 3, 4, 5, 6))
print("和为: ", result) -- 默认全局变量

print('"Lua": ', "Lua")
local str = [[L
u
a
教
程]]
print("str: ", str)

-- 闭包
local array = { "Google", "Runoob" }
local function elementIterator(collection)
  local index = 0
  local count = #collection
  -- 闭包函数
  return function() -- 一次性返回
    index = index + 1
    if index <= count
    then
      --  返回迭代器的当前元素
      return collection[index]
    end
  end
end

for element in elementIterator(array) do
  print(element)
end

-- 元表
-- setmetatable(table,metatable)
-- 1.在表中查找，如果找到，返回该元素，找不到则继续
-- 2.判断该表是否有元表，如果没有元表，返回 nil，有元表则继续。
-- 3.判断元表有没有 __index 方法，如果 __index 方法为 nil，则返回 nil；如果 __index 方法是一个表，则重复 1、2、3；如果 __index 方法是一个函数，则返回该函数的返回值。
local mytable = setmetatable({ key1 = "value1" }, {
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})
-- local mytable = setmetatable({ key1 = "value1" }, {
--   __index = {
--     key2 = "metatablevalue"
--   }
-- })
print(mytable.key1)
print(mytable.key2)

-- 文件 I/O
local file = io.open("test.txt", "w+")
io.output()
if file
then
  io.output(file)
  io.write("WHOAMI")
end
io.close(file)

-- 错误处理
-- assert首先检查第一个参数，若没问题，assert不做任何事情；
-- 否则，assert以第二个参数作为错误信息抛出。
local function add(a, b)
  assert(type(a) == "number", "a 不是一个数字")
  assert(type(b) == "number", "b 不是一个数字")
  return a + b
end

add(1, 2)
-- error("Some error message here.")

local function myfunction()
  error("Some error message here.")
end

local function myerrorhandler(err)
  -- print(debug.traceback())
  print("ERROR:", err)
end

local status = xpcall(myfunction, myerrorhandler)
print(status)

--[[
  面向对象
]]
--创建一个类，表示四边形
local RectAngle = {}
-- 基础类方法 new
function RectAngle:new(length, width) --声明新建实例的New方法
  -- local o = {
  --   --设定各个项的值
  --   self.length = len or 0,
  --   self.width = wid or 0,
  --   self.area = len * wid
  -- }
  -- setmetatable(o, { __index = self }) --将自身的表映射到新new出来的表中
  local o = {}
  setmetatable(o, self)
  self.__index = self
  self.length = length or 0
  self.width = width or 0
  self.area = length * width;
  return o
end

-- 获取表内信息的方法
function RectAngle:getInfo()
  return self.length, self.width, self.area
end

-- 创建对象
local myshape = RectAngle:new(2, 3)
print(myshape:getInfo())
