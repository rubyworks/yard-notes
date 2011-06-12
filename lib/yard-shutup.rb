require 'yard/docstring'

module YARD
  class Docstring

    # Creates a tag from the `Tags::DefaultFactory` tag factory.
    # 
    # To add an already created tag object, use `#add_tag`
    #
    # @TODO This is my tood note!
    # @TODO Add command option to turn warnings back on.
    # @TODO Keep track of auto-defined tags for later listing or template.
    #
    # @param [String] tag_name the tag name
    # @param [String] tag_buf the text attached to the tag with newlines removed.
    # @return [Tags::Tag, Tags::RefTag] a tag
    def create_tag(tag_name, tag_buf)
      if tag_buf =~ /\A\s*(?:(\S+)\s+)?\(\s*see\s+(\S+)\s*\)\s*\Z/
        return create_ref_tag(tag_name, $1, $2)
      end

      tag_factory = Tags::Library.instance
      tag_method = "#{tag_name}_tag"
      if tag_name
        if tag_factory.respond_to?(tag_method)
          add_tag(*[tag_factory.send(tag_method, tag_buf)].flatten)
        else
          Tags::Library.define_tag(tag_name.to_s.capitalize, tag_name)
          add_tag(*[tag_factory.send(tag_method, tag_buf)].flatten)
        end
      else
        log.warn "Unnamed tag @#{tag_name}" + (object ? " in file `#{object.file}` near line #{object.line}" : "")
      end
    rescue Tags::TagFormatError
      log.warn "Invalid tag format for @#{tag_name}" + (object ? " in file `#{object.file}` near line #{object.line}" : "")
    end

  end
end
