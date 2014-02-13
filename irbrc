def mvim
  edit_interactively 'mvim -f -c "set filetype=ruby"'
end

class Object
  def send_chain(meths)
    result = self
    meths.each do |m|
      return nil if result == nil
      if result.respond_to?(m)
        result = result.__send__(m)
      elsif result.respond_to?(:[])
        result = result[m]
      else
        raise "#{result.class} doesn't respond to #{m}"
      end
    end
    result
  end
end

module Enumerable
  def supermap(*args, &block)
    res = []
    self.each do |e|
      arr = []
      args.each { |a| arr << e.send_chain(a.to_s.split('.')) }
      arr << block.call(e) if block
      res << arr
    end
    res
  end
end

$vdiff_difftool = 'diff'

require 'pp'
class Object
  def vdiff(other)
    require 'tempfile'
    t1 = Tempfile.new(['vdiff', '.rb'])
    t2 = Tempfile.new(['vdiff', '.rb'])
    PP.pp self, t1
    PP.pp other, t2
    t1.flush; t2.flush
    puts `#{$vdiff_difftool} #{t1.path} #{t2.path}`
    t1.close
    t2.close
  end
end
class Hash
  def each_sorted_pair
    self.keys.sort.each do |k|
      yield k, self[k]
    end
  end
end
module PP::PPMethods
  def pp_hash(obj)
    group(1, '{', '}') {
      seplist(obj, nil, :each_sorted_pair) {|k, v|
        group {
          pp k
          text '=>'
          group(1) {
            breakable ''
            pp v
          }
        }
      }
    }
  end
end


# recursive diff that doesn't suck
require 'set'
class Array
  def rdiff(other, seen = Set.new)
    return if seen.include?(self)
    seen << self
    result = []
    # this would be more awesome with FIBER
    my = self
    your = other
    my.each_with_index do |elem, i|
      if elem.respond_to?(:rdiff)
        result << elem.rdiff(your, seen)
      else
        result << (elem == your[i] ? nil : your[i])
      end
    end
    if my.size > your.size
      (my.size - your.size).times { result << nil }
    elsif your.size > my.size
      (your.size - my.size).times { |i| result << your[my.size + i] }
    end
    result
  end
end
class Hash
  def rdiff(other_hash, seen = Set.new)
    return if seen.include?(self)
    seen << self
    result = {}
    (self.keys + other_hash.keys).uniq.each do |key|
      my = self[key]
      your = other_hash[key]
      if my.respond_to?(:rdiff)
        diff = my.rdiff(your, seen)
        result[key] = diff if diff
      else
        result[key] = your unless my == your
      end
    end
    result
  end
end

def iglobal_id(id, shard_id = 1)
  id + (10_000_000_000_000 * shard_id)
end
