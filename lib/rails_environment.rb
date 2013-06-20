module RailsEnvironment
  
  @mutex = Mutex.new
  @environments = nil
  @environment_strings = {
    'development' => {
      'short' => 'DEV',
      'long'  => 'Development'
    },
    'test' => {
      'short' => 'TST',
      'long'  => 'Test'
    },
    'staging' => {
      'short' => 'STG',
      'long'  => 'Staging'
    },
    'quality_assurance' => {
      'short' => 'QA',
      'long'  => 'Quality Assurance'
    },
    'production' => {
      'short' => 'PRD',
      'long'  => 'Production'
    },
  }
  
  class << self
    
    def rails_env
      Rails.env
    end

    def short
      strings = @environment_strings[rails_env]
      (strings && strings['short']) || rails_env
    end
    
    def long
      strings = @environment_strings[rails_env]
      (strings && strings['long']) || rails_env
    end
    
    def load_environments
      @mutex.synchronize do
         @environments = Dir[Rails.root.join('config/environments/*.rb')].map { |f| File.basename(f, '.rb') }
      end
    end
    
    def environments
      @environments ||= load_environments
    end
    
    def environment_strings
      @environment_strings
    end
    
    def method_missing(method, *args)
      if method =~ /^(.*)\?/ && environments.include?($1)
        rails_env == $1
      elsif method.to_s =~ /^not_(.*)$/
        ! send($1)
      elsif method.to_s =~ /(.*_or_.*)\?/
        methods = $1.split("_or_")
        methods.any? { |m| self.send("#{m}?") }
      else
        super(method, *args)
      end
    end
    
  end
end