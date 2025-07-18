class Parent
  def call; 'Parent'; end
end

module Extend1
  def call; 'Extend1'; end
end

module Extend2
  def call; 'Extend2'; end
end

module Include1
  def call; 'Include1'; end
end

module Include2
  def call; 'Include2'; end
end

module Prepend1
  def call; 'Prepend1'; end
end

module Prepend2
  def call; 'Prepend2'; end
end

class Example < Parent
  extend Extend1
  extend Extend2
  include Include1
  include Include2
  prepend Prepend1
  prepend Prepend2

  def call; 'Instance method'; end
  def self.call; 'Class method'; end
end

p Example.new.() # => [Prepend2, Prepend1, Instance method, Include2, Include1, Parent, method_missing]
p Example.ancestors # => [Prepend2, Prepend1, Example, Include2, Include1, Parent, Object, Kernel, BasicObject]

p Example.() # => [Class method, Extend2, Extend1, method_missing]
p Example.singleton_class.ancestors # => [#<Class:Example>, Extend2, Extend1, #<Class:Parent>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]
