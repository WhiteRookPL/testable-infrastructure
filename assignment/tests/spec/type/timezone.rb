module Serverspec
  module Type

    class TimeZone < Base

      def initialize
        @name = "Timezone"
      end

      def content
        get_tz
      end

      def utc?
        get_tz == "UTC"
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
end

include Serverspec::Type
