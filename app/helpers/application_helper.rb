module ApplicationHelper
  def resource_error_messages!(resource)
    login_error = []
    clear_flag = false
    flash.each do |key, value|
      if value == "Invalid Flat or Password."
        login_error.push(value)
        clear_flag = true
      end
    end
    flash.clear if clear_flag

    return '' if resource.errors.empty? && login_error.empty?

    errors = resource.errors.empty? ? login_error : resource.errors.full_messages
    messages = errors.map { |msg| content_tag(:li, msg) }.join

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

  def flats_list_with_id
    registered = Member.all.map(&:login)
    available = []
    ['A','B'].each do |block|
      last_flat = block == 'A' ? 11 : 12
      ['GF','FF','SF','TF','FOF'].each do |floor|
        (1..last_flat).to_a.map{|x| ('%02d' % x)}.each do |flat|
          flat_str = (floor + flat + "-" + block)
          if registered.include?(flat_str)
            member = Member.find_by_login(flat_str)
            available << [member.name_with_flat, member.id]
          end
        end
      end
    end
    available
  end

  def default_meta_tags
    title = 'Ajantha Prime | APOWA'
    description = 'Lavakusha Nagar, Konappana Agrahara, Beratana Agrahara, Electronic City Phase 1, Bangalore, Bengaluru, Karnataka - 560100'
    {
      site: 'Ajantha Prime',
      title: title,
      description: description,
      keywords: 'Ajantha Prime, APOWA, Portal, Apartment, Association, near Metro, near PES, Ajantha Royal',
      icon: asset_path('favicon.ico'),
      image_src: asset_url('Ajantha-logo-medium.png'),
      og: {
        title: title,
        description: description,
        type: 'apartment',
        url: root_url,
        site_name: title,
        image: [asset_url("Ajantha-logo-medium.png"), asset_url("Ajantha-logo-round-small.jpg")]
      }
    }
  end
end
