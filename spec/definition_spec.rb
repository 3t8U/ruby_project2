require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Horse", nil, nil)
    @word.save()
  end

  describe('#==') do
    it("determines if it is the same definition and if it has the same attributes as another definition, it merges them") do
      def1 = Definition.new("Large animal", @word.id, nil)
      def2 = Definition.new("Large animal", @word.id, nil)
      expect(def1).to(eq(def2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      horse1 = Definition.new("Dog food", @word.id, nil)
      horse1.save()
      horse2 = Definition.new("Large animal", @word.id, nil)
      horse2.save()
      expect(Definition.all).to(eq([horse1, horse2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      horse1 = Definition.new("Dog food", @word.id, nil)
      horse1.save()
      horse2 = Definition.new("Large animal", @word.id, nil)
      horse2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
      it("saves a definition to the list") do
        horse = Definition.new("Dog food", @word.id, nil)
        horse.save()
        expect(Definition.all).to(eq([horse]))
      end
    end

    describe('.find') do
        it("finds a definition by id") do
          horse1 = Definition.new("Dog food", @word.id, nil)
          horse1.save()
          horse2 = Definition.new("Large animal", @word.id, nil)
          horse2.save()
          expect(Definition.find(horse1.id)).to(eq(horse1))
        end
      end

    describe('#update') do
      it("updates a definition by id") do
        horse = Definition.new("Dog food", @word.id, nil)
        horse.save()
        horse.update("Mr. Ed", @word.id)
        expect(horse.name).to(eq("Mr. Ed"))
      end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      horse1 = Definition.new("Dog food", @word.id, nil)
      horse1.save()
      horse2 = Definition.new("Large animal", @word.id, nil)
      horse2.save()
      horse1.delete()
      expect(Definition.all).to(eq([horse2]))
    end
  end

  describe('.find_by_word') do
  it("finds definitions for a word") do
    word = Word.new("Yak", nil, nil)
    word.save
    def1 = Definition.new("Hooves", @word.id, nil)
    def1.save()
    def2 = Definition.new("Big hairy monster cow", word.id , nil)
    def2.save()
    expect(Definition.find_by_word(word.id)).to(eq([def2]))
  end
end

describe('#Word') do
  it("finds the word a definition belongs to") do
    definition = Definition.new("Large animal", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end






































end
