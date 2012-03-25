module BruteTools
  module Checker
    class Base
      attr_accessor :data_provider
      attr_accessor :proxy_list
      attr_reader :config

      def initialize(options = {})
        @data_provider = options.delete(:data_provider)
        @proxy_list = options.delete(:proxy_list)
        
        @callbacks = {}
        load_callbacks(options.delete(:callbacks)) if options.key?(:callbacks)
        
        # Load default config
        config.merge!({
          :debug => false
        })
        
        # Load options left to config
        config.merge!(options)
      end
      
      # Config is used to store configuration
      def config
        @config ||= {}
      end
      
      # Adds a new callback for specified name
      # When passed both `proc` and block, two callbacks are added
      def add_callback(name, proc = nil, &block)
        name = name.to_sym
        @callbacks[name] ||= []
        @callbacks[name].concat([proc, block].compact)
        self
      end
      
      # Adds callbacks from hash
      # { :callback_name => proc { ... } }
      def load_callbacks(callbacks = {})
        callbacks.each{ |name, block| add_callback(name, block) }
        self
      end
      
      # Can be overwritten by implementation to extend callbacks
      def get_registered_callbacks(name)
        @callbacks[name.to_sym]
      end
      
      # Calls all callbacks registred for the specific name
      def run_callback(name, *args)
        procs = get_registered_callbacks(name)
        procs.each{ |proc| proc.call(*args) }
        self
      end
      
      # This is where all the work goes
      def run
        raise "You must implement this!"
      end
    end
  end
end
