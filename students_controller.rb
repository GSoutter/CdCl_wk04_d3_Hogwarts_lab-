require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./models/student.rb')
also_reload('./models/*')

get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end
