require "middleman-core"
require "middleman-piwik/version"

::Middleman::Extensions.register(:piwik) do
  require "middleman-piwik/extension"
  ::Middleman::Piwik::PiwikExtension
end
