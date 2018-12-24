module ApplicationHelper
  def resource_error_messages!(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

  def flats_list
    registered = Member.all.map(&:login)
    available = []
    ['A','B'].each do |block|
      last_flat = block == 'A' ? 11 : 12
      ['GF','FF','SF','TF','FOF'].each do |floor|
        (1..last_flat).to_a.map{|x| ('%02d' % x)}.each do |flat|
          flat_str = (floor + flat + "-" + block)
          if registered.include?(flat_str)
            available << flat_str
          end
        end
      end
    end
    available
  end
end
