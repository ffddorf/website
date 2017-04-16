# use Compass for advanced CSS
compass_config do |config|
  config.output_style = :compact
end

helpers do
  def nav_li(text, url)
    trailurl = url
    trailurl += '/' unless url == '/'
    if trailurl == current_page.url
      active = 'active'
    end
    content_tag :li, class: active do
      link_to(text, url)
    end
  end
end

activate :directory_indexes

activate :data_source do |c|
  c.root  = "https://images.freifunk-duesseldorf.de/gluon/stable/"
  c.files = [
    "version.json"
  ]
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
end

# deploy Netlify redirects file
page 'redirects', :layout => false
after_build do
  File.rename 'build/redirects', 'build/_redirects'
end

require 'html-proofer'

after_build do |builder|
  begin
    HTMLProofer.check_directory(config[:build_dir], {
      :assume_extension => true,
      :url_ignore => ["http://192.168.0.1"]
    }).run
  rescue RuntimeError => e
    puts e
    exit 1
  end
end
