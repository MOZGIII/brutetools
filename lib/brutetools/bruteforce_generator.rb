module BruteTools
  class BruteforceGenerator
    def initialize(alphabet, start = 0)
      @alphabet = alphabet
      @alphabet = @alphabet.split('') if @alphabet.kind_of? String
      @start = start
      @start = @alphabet[0] * @start if @start.kind_of? Numeric
      @length = @start.length
      @buff = @start.split('').map{ |e| @alphabet.index(e) }
    end
    
    def next
      return nil if @buff.all?{ |o| o == @alphabet.size - 1 }
      
      poped = []
      poped << @buff.pop while @buff.last == @alphabet.size - 1
      @buff[-1] += 1
      @buff += ([0] * poped.length)

      @buff.map{ |i| @alphabet[i] }.join
    end
  end
end