object false

node(:errors) do
  { :code => 400, :message => 'Bad request', :error => @error }
end
