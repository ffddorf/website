# use Compass for advanced CSS
compass_config do |config|
  config.output_style = :compact
  config.http_path = "/"
  config.images_dir = "img"
  config.javascripts_dir = "js"
end

require 'font-awesome-sass'

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

set :css_dir, 'stylesheets'

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
  activate :gzip
end

# deploy Netlify redirects file
page 'redirects', :layout => false
after_build do
  File.rename 'build/redirects', 'build/_redirects'
end
