module RailsEnvironment
  
  @@environments = nil
  
  class << self
    
    def rails_env
      Rails.env
    end

    def load_environments
      Dir[Rails.root.join('config/environments/*.rb')].map { |f| File.basename(f, '.rb') }
    end
    
    def environments
      @@environments ||= load_environments
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