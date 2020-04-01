require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./models/student.rb')
also_reload('./models/*')

get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end

get '/hogwarts/new' do
  @houses = House.all()
  erb(:new)
end

post '/hogwarts' do
  @new_student = Student.new(params)
  @new_student.save()
  erb(:create)
end
