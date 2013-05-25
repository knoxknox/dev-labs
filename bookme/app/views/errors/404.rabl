object false

node(:errors) do
  { :code => 404, :message => 'This record is not found', :error => @error }
end
