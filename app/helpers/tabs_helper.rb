module TabsHelper
  def new_fields_template(f,association,options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= "/tabs/child_fields"
    options[:template] ||= "children_fields"
    options[:f] ||= :f

    tmpl = content_tag(:div,:id =>"#{options[:template]}") do
      tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |b|
        render(partial: options[:partial], locals: {f: b})
      end
    end



    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end
  def add_child_button(name, association,target)
    content_tag(:spam,"<span>#{name}</span>".html_safe,
    :class => "add_child",
      :style => "cursor:pointer; border:1px solid #2a9fd6;",
      :"data-association" => association,
      :target => target)
  end
  def remove_child_button(name)
    content_tag(:div,"<span>Remove</span>".html_safe,
                :style => "cursor:pointer; border:1px solid #2a9fd6; display:inline-block;",
                :class => "remove_child")
  end
end
