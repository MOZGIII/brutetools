module BruteTools
  module DataProvider
    class Base
      
      # Get next data portion (next word from dictionary etc)
      def next
        raise "You must implement this!"
      end
      
      # Just one step back in data portion queue (one word back in dictionary)
      # Calling `next`, then `regress`, thn `next` again must return the same value.
      # Depending on a situation, you may even have to implement a history of `next`s!
      def regress
        raise "You must implement this!"
      end
      
    end
  end
end