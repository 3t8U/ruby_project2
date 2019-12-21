require 'rspec'
require 'word'
require 'definition'


describe '#Word' do

  before(:each) do
    Word.clear
    Definition.clear
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

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word.update("shoe", nil)
      expect(word.name).to(eq("shoe"))
    end
  end

  describe('#add_properties') do
    it("Add a pronounciation to a word") do
      word = Word.new("shoe", nil, "ssh-ooh")
      word.save()
      expect(word.pronounce).to(eq("ssh-ooh"))
    end
  end

  #ADD MORE PRopERTIES!!!!!
  #____--____-----___-___-_

  describe('#sort') do
    it("Sort list of word alphabetically") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      word3 = Word.new("cat", nil, nil)
      word3.save()
      expect(Word.sort).to(eq([word3, word2, word]))
    end
  end

  describe('.search') do
    it("search for a word through a list of words") do
      word = Word.new("shoe", nil, nil)
      word.save()
      word2 = Word.new("horse", nil, nil)
      word2.save()
      word3 = Word.new("cat", nil, nil)
      word3.save()
      expect(Word.search("cat")).to(eq([word3]))
    end
  end

  describe('#definitions') do           
    it("returns a word's definitions") do
      word = Word.new("Horse", nil, nil)
      word.save()
      def1 = Definition.new("Large animal", word.id, nil)
      def1.save()
      def2 = Definition.new("Dog food", word.id, nil)
      def2.save()
      expect(word.definitions).to(eq([def1, def2]))
    end
  end






































end
