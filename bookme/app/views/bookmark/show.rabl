object @data

attributes :id, :url, :title
child(:user) { attributes :name }
node(:errors) {|record| record.errors }
