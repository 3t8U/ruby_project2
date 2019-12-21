require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  if params["clear"]
    @words = Word.clear()
  elsif params["search_input"]
    @words = Word.search(params["search_input"])
  elsif params["sort_list"]
    @words = Word.sort()

  else
    @words = Word.all
  end
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  pronounce = params[:pronounce_name]
  word = Word.new(name, nil, pronounce)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
@word = Word.find(params[:id].to_i())
erb(:edit_word)
end

patch('/words/:id') do
@word  = Word.find(params[:id].to_i())
@word.update(params[:name], params[:pronounce])
@words = Word.all
erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

#DEFINITiON FUNCTIONALITY !!!!


get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

# Post a new definition. After the definition is added, Sinatra will route to the view for the word the definition belongs to.
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end

# Edit a definition and then route back to the word view.
patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

# Delete a definition and then route back to the word view.
delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
