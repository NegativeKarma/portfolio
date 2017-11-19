Haml::TempleEngine.disable_option_validator!
activate :livereload

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

require 'lib/helper'
helpers ContentHelper
helpers do
    def display_date
        DateTime.now.strftime('%F %H:%M')
    end
    def get_last_push_date(user_name, repo_name)
        url = "https://api.github.com/repos/#{user_name}/#{repo_name}"
        info = open(url).read
        json_response = JSON.parse(info)
        date = DateTime.parse(json_response['pushed_at'])
        date.strftime('%F %H:%M')
    end
end


# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
