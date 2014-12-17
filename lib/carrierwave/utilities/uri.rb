# encoding: utf-8

module CarrierWave
  module Utilities
    module Uri

    private
      def encode_path(path)
        # based on Ruby's URI.encode (see lib/uri/common.rb)
        safe_string = URI::REGEXP::PATTERN::UNRESERVED + URI::REGEXP::PATTERN::RESERVED + '\/'
        unsafe = Regexp.new("[^#{safe_string}]", false)

        path.to_s.gsub(unsafe) do
          us = $&
          tmp = ''
          us.each_byte do |uc|
            tmp << sprintf('%%%02X', uc)
          end
          tmp
        end
      end
    end # Uri
  end # Utilities
end # CarrierWave
