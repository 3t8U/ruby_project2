class Word
  attr_accessor :id, :name, :pronunce,

  @@words ={}
  @@total_rows = 0

  def initialize(name, id, pronounce)
    @name = name
    @id = id || @@total_rows += 1
    @pronounce = pronounce
  end

  def update(name, pronounce)
    @name = name
    @pronounce = pronounce
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id, self.pronounce)
  end

  def ==(word_to_conpare)
    self.name() == word_to_compare.name()
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@total_rows = 0
    @@words = {}
  end

  def self.find(id)
    @@words[id]
  end

  def delete
    @@words.delete(self.id)
  end

  def self.sort
    @@words.values.sort {|a, b| a.name.downcase <=> b.name.downcase}
  end

  def self.search(x)
    @@words.values.select { |e| /#{x}/i.match? e.name}
  end

  def definitions
    definition.find_by_word(self.id)
  end


end
