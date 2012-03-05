# @TODO Add command option to turn warnings back on.
module YARD

  module Tags

    # Alternate factory in which 
    #
    # @NOTE I have a feeling this might all end up here
    # once lsegal sees what his code is actually doing.
    class AutoFactory < DefaultFactory
    end

    class Library

      class << self
        # Sets the list of tags that are not explicitly defined by the 
        # YARD proper, nor by the user on the cammnd line via `--tag`.
        # These are tags are recorded as "developer's tags" and not
        # displayed in the general documentation.
        #
        # @return [Array<Symbol>] a list of transitive tags
        # @since 0.6.0
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

end

YARD::Tags::Library.default_factory = YARD::Tags::AutoFactory.new

