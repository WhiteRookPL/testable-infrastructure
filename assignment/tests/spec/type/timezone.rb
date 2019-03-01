module Serverspec::Type

  class TimeZone < Base

    def initialize
      super("Timezone")
    end

    def content
      get_tz
    end

    def utc?
      get_tz.stdout.include? "UTC"
    end

    private
    def get_tz
      @runner.run_command('date +"%Z %z"')
    end

  end

  def timezone
    TimeZone.new()
  end

end

include Serverspec::Type
