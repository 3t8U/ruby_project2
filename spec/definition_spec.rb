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
      def1 = Definition.new("Dog food", @word.id, nil)
      def1.save()
      def2 = Definition.new("Large animal", @word.id, nil)
      def2.save()
      expect(Definition.all).to(eq([def1, def2]))
    end
  end









































end
