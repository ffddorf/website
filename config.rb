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
