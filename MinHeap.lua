--Lua工具 最小堆

--[[
simple example:
local MH = require "KMQ/MinHeap"
local mh = MH()
mh.Push(10)
mh.Push(3)
mh.Push(2)
mh.Push(1)

print(mh.Pop())
print(mh.Pop())
print(mh.Pop())
]]--

local function MinHeap()
  local this = {}
  
  --privte methods
  local ShiftUp
  local SinkDown
  
  --private data
  local data = {}
  local size = 0
  
  function this.init()
      return this
  end

  function this.Push(num)
      table.insert( data, num)
      size = size + 1
      ShiftUp(#data)
  end
  
  function this.Pop()
    if size <= 0 then
      return nil
    end
    
    local ret = data[1]
    local endNum = table.remove(data,size)
    size = size - 1
    data[1] = endNum
    SinkDown(1)
    return ret
  end

  --private
  function ShiftUp(nIndex)
      if nIndex <= 1 then
          return true
      end
      local parentIdx = nIndex // 2

      if data[nIndex] < data[parentIdx] then
          data[nIndex],data[parentIdx] = data[parentIdx],data[nIndex]
          return ShiftUp(parentIdx)
      else
          return true
      end
  end

  function SinkDown(nIndex)    
    local leftIdx = nIndex * 2
    local rightIdx = nIndex * 2 + 1    
    local targetIdx = leftIdx
    
    if rightIdx <= size and data[rightIdx] < data[leftIdx] then
      targetIdx = rightIdx
    elseif leftIdx > size then
      return true
    end
    
    if data[nIndex] > data[targetIdx] then
      data[nIndex],data[targetIdx] = data[targetIdx],data[nIndex]
      SinkDown(targetIdx)
    end
    return true
  end

  return this.init()

end

return MinHeap