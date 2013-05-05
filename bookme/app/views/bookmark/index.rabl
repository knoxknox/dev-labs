collection @data, :root => :data

attributes :id, :url, :title
child(:user) { attributes :name }
node(:is_updated) {|record| record.created_at != record.updated_at }
