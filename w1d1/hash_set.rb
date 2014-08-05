class MyHashSet
  def initialize
    @store = Hash.new(false)
  end
  def insert(el)
    @store[el] = true
  end
  def include?(el)
    @store[el]
  end
  def delete(el)
    present = include?(el)
    if present
      @store.delete(el)
    end
    present
  end
  def to_a
    @store.keys
  end
  def union(set2)
    combined = MyHashSet.new
    @store.each_key do |key|
      combined.insert(key)
    end
    set2.to_a.each do |key|
      unless combined.include?(key)
        combined.insert(key)
      end
    end
    combined
  end
  
  def intersect(set2)
    combined = MyHashSet.new
    @store.each_key do |key|
      if set2.include?(key)
        combined.insert(key)
      end
    end
    combined
  end
  
  def minus(set2)
    combined = MyHashSet.new
    @store.each_key do |key|
      unless set2.include?(key)
        combined.insert(key)
      end
    end
    combined
  end
end

h = MyHashSet.new
p h.insert("test_value")
p h.include?("test_value")
p h.include?("falseness")
p h.delete("test_value")
h.insert("test_value")
p h.insert("aa_aa")
p h.insert("bb_bb")
p h.to_a

j = MyHashSet.new
p j.insert("j_value_1")
p j.insert("j_value_2")
j.insert("test_value")

p h.union(j)
p h.intersect(j)
p h.minus(j)