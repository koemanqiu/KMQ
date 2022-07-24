local function MinHeap()
  local this = {}
  
  function this.init()
      this._lbData = {};
      this._dataLen = 0;
      return this
  end

  function this.push(num)
      table.insert( this._lbData, num);
      this._dataLen = this._dataLen + 1;
      this.sortHeap(#this._lbData); 
  end

  function this.sortHeap(nIndex)
      if nIndex <= 1 then
          if nIndex ~= 1 then
              print("sort error")
          end
          return true;
      end
      local fIndex;
      if nIndex%2 == 0 then
          fIndex = nIndex/2;
      else
          fIndex = (nIndex-1)/2;
      end
      if this._lbData[nIndex] < this._lbData[fIndex] then
          this._lbData[nIndex],this._lbData[fIndex] = this._lbData[fIndex],this._lbData[nIndex];
          return this.sortHeap(fIndex);
      else
          return true;
      end
  end

  function this.remove()
      local ret = this._lbData[1];
      local endNum = table.remove(this._lbData,this._dataLen);
      this._dataLen = this._dataLen - 1;
      this._lbData[1] = endNum;
      this.sortHeap2(1);    
      return ret;
  end

  function this.sortHeap2(nIndex)
      local cIndex = nIndex*2;
      if cIndex <= this._dataLen and this._lbData[cIndex] < this._lbData[nIndex] then
          this._lbData[nIndex],this._lbData[cIndex] = this._lbData[cIndex],this._lbData[nIndex];
          this.sortHeap2(cIndex);
          cIndex = nIndex*2+1;
          if this._lbData[cIndex] < this._lbData[nIndex] then
              this._lbData[nIndex],this._lbData[cIndex] = this._lbData[cIndex],this._lbData[nIndex];
              this.sortHeap2(cIndex)
          end
      end
      cIndex = nIndex*2+1;
      if cIndex <= this._dataLen and this._lbData[cIndex] < this._lbData[nIndex] then
          this._lbData[nIndex],this._lbData[cIndex] = this._lbData[cIndex],this._lbData[nIndex];
          this.sortHeap2(cIndex);
      end
      return true;
  end

  return this.init()

end

return MinHeap