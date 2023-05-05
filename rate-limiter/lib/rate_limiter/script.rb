module RateLimiter
  module Script
    def self.load(script_name)
      File.read(File.join(__dir__, 'scripts', script_name))
    end
  end
end
