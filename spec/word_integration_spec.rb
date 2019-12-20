require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'SEAHORSE')
    click_on('Go!')
    expect(page).to have_content('SEAHORSE')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word with a definition and then goes to the word page') do
    word = Word.new("Seacrest", nil, nil,)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'Foamy & Aquamarine')
    click_on('Add definition')
    expect(page).to have_content('Foamy & Aquamarine')
  end
end
