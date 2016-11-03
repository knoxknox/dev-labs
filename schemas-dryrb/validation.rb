##
# Documentation:
# http://dry-rb.org/gems/dry-validation/
#
require 'dry-validation'

json_schema = Dry::Validation.JSON do
  required(:list) do
    array? & min_size?(3) & each(:str?, min_size?: 2)
  end
end

user_schema = Dry::Validation.Schema do
  required(:uid) { filled? }
  required(:age) { filled? & int? & lt?(60) }
  required(:nested).schema { optional(:ids).each { gteq?(10) } }
end

json_schema.call(list: '').errors # {:list=>["must be an array"]}
json_schema.call(list: ['foo', 'bar']).errors # {:list=>["size cannot be less than 3"]}
json_schema.call(list: ['foo', 'bar', 100]).errors # {:list=>{2=>["must be a string"]}}
json_schema.call(list: ['x', 'foo', 'bar']).errors # {:list=>{0=>["size cannot be less than 2"]}}
json_schema.call(list: ['foo', 'bar', 'baz']).errors # {} => see schema.success? / schema.failure?
user_schema.call(uid: 42, age: 42, nested: {ids: [0, 10, 20]}).errors # {:nested=>{:ids=>{0=>["must be greater than or equal to 10"]}}}
