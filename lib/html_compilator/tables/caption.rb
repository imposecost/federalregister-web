class HtmlCompilator::Tables::Caption
  def self.generate(options)
    table = options.fetch(:table)
    table.node.xpath('TTITLE|NRTTITLE|TDESC').map do |node|
      new(
        :table => table,
        :node => node
      )
    end
  end

  attr_reader :table, :node

  def initialize(options)
    @table = options.fetch(:table)
    @node = options.fetch(:node)
  end

  def type
    case node.name
    when "TTITLE", "NRTTITLE"
      :title
    when "TDESC"
      :headnote
    else
      raise "unknown caption type: #{node.name}"
    end
  end

  def body
    table.transform(node.to_xml)
  end
end
