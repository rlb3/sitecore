require 'cgi'

module Sitecore
  class Url
    class Dsl
      attr_reader :item_web_hook
      attr_accessor :base_uri, :sc_itemid, :version, :database, :language, :fields, :payload, :query, :page, :size

      def initialize(base_uri)
        @base_uri           = base_uri
        @version            = 1
        @item_web_hook      = "/-/item/v#{@version}"
        @sc_itemid          = ''
        @version            = ''
        @database           = ''
        @language           = ''
        @fields             = []
        @payload            = ''
        @query              = ''
        @page               = ''
        @size               = ''
      end

      def build
        url = "#{base_uri}#{item_web_hook}/?"
        url += [sc_itemid, version, database, language, fields, payload, query, query, page, size].each_with_object('') do |param, u|
          u << param + '&' unless param.empty?
          url
        end.chop
      end

      def item_id(id)
        escaped_id = CGI::escape("{#{id}}")
        self.sc_itemid = "sc_itemid=#{escaped_id}"
        self
      end

      def item_version(version)
        self.version = "sc_itemversion=#{version}" if version
        self
      end

      def item_database(database)
        self.database = "sc_database=#{database}" if database
        self
      end

      def item_language(language)
        self.language = "language=#{language}" if language
        self
      end

      def fields
        if @fields.size > 1
          @fields.join('&')
        else
          @fields.first
        end
      end

      def item_fields(fields)
        binding.pry
        @fields << "fields=#{fields}" if fields
        self
      end

      def item_payload(payload)
        self.payload = "payload=#{payload}" if payload
        self
      end

      def item_query(query)
        self.query = "query=#{query}" if query
      end

      def item_page(page, size)
        if !page.zero? && !size.page.zero?
          self.page = "page=#{page}"
          self.page_size = "pageSize=#{size}"
        end
      end
    end
  end
end
