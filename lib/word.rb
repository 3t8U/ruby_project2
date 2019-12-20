class Word
attr_accessor :id, :word_name, :pronunce,

@@words ={}
@@total_rows = 0

def initialize(word_name, id, pronounce)
  @word_name = word_name
  @id = id || @@total_rows += 1
  @pronounce = pronounce
end

































end
