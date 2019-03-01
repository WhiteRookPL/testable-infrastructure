module Serverspec
  module Type

    class TimeZone < Base

      def initialize
        @timezone
      end

      private
      def get_tz
        @runner.run_command('date +"%Z %z"')
      end

      def utc?
        get_tz == "UTC"
      end

    end

    def timezone
      TimeZone.new()
    end
  end
end

include Serverspec::Type
