module BruteTools
  module ProxyList
    class Base
      
      # TODO: finish this!
      
      def initialize(proxies)
        @list = proxies
      end
      
      def method_missing(meth, *args, &block)
        if @list.respond_to? meth
          @list.send(meth, *args, &block)
        else
          super
        end
      end
      
    end
  end
end