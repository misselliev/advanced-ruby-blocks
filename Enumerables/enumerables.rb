module Enumerable
#1
  def my_each
    return self.to_enum if !block_given? #to-enum crea un nuevo enum llamando el metodo a un obj
    for i in self
      yield i 
    end
  end

#2
def my_each_with_index
  return self.to_enum if !block_given?
  index = 0
  for i in self
    yield i, index 
    index +=1
    end
end

#3
def my_select
  return self.to_enum if !block_given?
  sel =[]
  for i in self
    sel << i yield i
  end
  return sel
end

#4
def my_all?
  return self.to_enum if !block_given?
  yes =[]
  for i in self
    yes << i yield i
  end
  return true if yes.size == self.size
end

#5
def my_any?
  return self.to_enum if !block_given?
  yes =[]
  for i in self
    yes << i yield i
  end
  return true if yes.size > 0
end

#6
def my_none?
  return self.to_enum if !block_given?
  yes =[]
  for i in self
    yes << i yield i
  end
  return true if yes.size == 0
end
  
#7
def my_count
  return self.to_enum if !block_given?
  count = 0
  for i in self
    yield i, count 
    count +=1
    end
end

#8
def my_map
return self.to_enum if !block_given?
res =[]
for i in self
  res << i yield i
end
return res
end

#9
def my_inject
  return self.to_enum if !block_given?
  total = 0
  for i in self
    yield i
    total += i
  end
  return total
end 

#testing
  example =[1,4,6,2,8]
  example.my_each do |item| item
  end

  example.my_each_with_index do |item, item2| item, item2
  end

  example.my_select{|num| num.even?}

end

