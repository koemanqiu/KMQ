
local function Node(v)
    local this = {}
    local value = v
    local nextNode = nil
    
    function this.SetNext(n)
        nextNode = n
    end
    
    function this.GetNext()
      return nextNode
    end
    
    function this.GetValue()
      return value
    end
    
    return this
end


local function NodeList()
    local this = {}
    
    function this.SetValue(v)
      print("set lst value:"..v)
        if this.head == nil then
            local n = Node(v)
            this.last = n
            this.head = this.last
        else
            local n = Node(v)
            this.last.SetNext(n)
            this.last = n
        end
    end
    
    function this.Reverse()
      local p1, p2, p3
      p1 = this.head
      p2 = this.head.GetNext()
      
      if p1 == nil or p2 == nil then
        return 0
      end
            
      this.last = p1
      while p2 ~= nil do
        p3 = p2.GetNext()
        p2.SetNext(p1)        
        p1 = p2
        p2 = p3
      end

      this.head.SetNext(nil)
      this.head = p1
    end
    
    function this.Print()
      local n = this.head
      while ( n ~= nil) do
        print( n.GetValue())
        n = n.GetNext()
      end
    end    
    
    return this
end

return NodeList

