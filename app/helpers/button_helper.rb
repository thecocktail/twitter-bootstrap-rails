module ButtonHelper
  def button_group(options={}, &block)
    vert_class = "btn-group-vertical" if options[:vertical].present?
    content_tag(:div, :class => "btn-group #{vert_class}", &block)
  end

  def button_item(name=nil, args={})
    defaults = {}
    defaults[:class] = 'btn'
    options = defaults.merge(args){|key, oldval, newval| "#{newval} #{oldval}"}
    if options[:icon]
      name = "#{glyph(options[:icon][:name],options[:icon][:size]||'')} #{name}"
      options.delete(:icon)
    end
    link_to raw(name), options.delete(:path),options
  end

end