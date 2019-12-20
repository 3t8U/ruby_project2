require 'rspec'
require 'word'
require 'definition'


describe '#Word' do

  before(:each) do
    Word.clear
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another album") do
      word = Word.new("shoe", nil, nil)
      word2 = Word.new("shoe", nil, nil)
      expect(word).to(eq(word2))
    end
  end

  describe('#save') do
    it("save a word") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end


















































end
