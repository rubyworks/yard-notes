# @TODO Add command option to turn warnings back on.

module YARD

  module Tags

    # Alternate factory in which ...
    #
    # @NOTE I have a feeling this might all end up here once
    #       lsegal sees what his code is actually doing.
    class AutoFactory < DefaultFactory
    end

    class Library
      class << self
        # Sets the list of tags that are not explicitly defined by the 
        # YARD proper, nor by the user on the cammnd line via `--tag`.
        # These tags are recorded as "developer's tags" and not
        # displayed in the general documentation.
        #
        # SINCE: 0.6.0
        #
        # Returns [Array<Symbol>] a list of transitive tags.
        attr_accessor :developers_tags
      end

      self.developers_tags = []

      # If tag is missing then auto-define it.
      #
      # @TODO This is an example.
      def respond_to?(tag_method)
        if md = /_tag$/.match(tag_method.to_s)
          tag_name = md.pre_match
          Tags::Library.define_tag(tag_name.to_s.capitalize, tag_name)
          Tags::Library.developers_tags << tag_name.to_sym
          true
        else
          super(tag_method)
        end
      end
    end

  end

  module CodeObjects
    class NotesFileObject < ExtraFileObject
      #
      def initialize
        self.filename   = 'NOTES.md'
        self.name       = 'NOTES'
        self.attributes = SymbolHash.new(false)
      end

      def contents
        text  = []
        sort  = Hash.new{ |h,k| h[k] = [] }
        dtags = Tags::Library.developers_tags

        Registry.each do |code_object|
          code_object.tags.each do |tag|
            next unless dtags.include?(tag.name)
            sort[tag.name] << tag
          end
        end

        sort.each do |name, tags|
          text << "## #{name}"
          tags.each do |tag|
            text << "### #{tag.name}"
          end
        end

        parse_contents(text.join("\n\n"))
      end

      # @param [String] data the file contents
      def parse_contents(data)
        retried = false
        cut_index = 0
        data = data.split("\n")
        data.each_with_index do |line, index|
          case line
          when /^#!(\S+)\s*$/
            if index == 0
              attributes[:markup] = $1
            else
              cut_index = index
              break
            end
          when /^\s*#\s*@(\S+)\s*(.+?)\s*$/
            attributes[$1] = $2
          else
            cut_index = index
            break
          end
        end
        data = data[cut_index..-1] if cut_index > 0
        contents = data.join("\n")
        
        if contents.respond_to?(:force_encoding) && attributes[:encoding]
          begin
            contents.force_encoding(attributes[:encoding])
          rescue ArgumentError
            log.warn "Invalid encoding `#{attributes[:encoding]}' in #{filename}"
          end
        end
      rescue ArgumentError => e
        if retried && e.message =~ /invalid byte sequence/
          # This should never happen.
          log.warn "Could not read #{filename}, #{e.message}. You probably want to set `--charset`."
          contents = ''
          return
        end
        data.force_encoding('binary') if data.respond_to?(:force_encoding)
        retried = true
        retry
      end
      contents
    end
  end

  module CLI
    class Yardoc
      alias run_without_notes run
      def run(*args)
        @options[:files] << CodeObjects::NotesFileObject.new
        run_without_notes(*args)
      end
    end
  end

end

YARD::Tags::Library.default_factory = YARD::Tags::AutoFactory.new

