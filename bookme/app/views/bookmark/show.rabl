object @data

attributes :id, :url, :title
child(:user) { attributes :name }
node(:locale) { I18n.locale }
node(:translation) { I18n.t('hello') }
node(:errors) {|record| record.errors }
