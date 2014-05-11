module Middleman
  module Piwik
    class PiwikExtension < Extension
      option :id, 1, 'Piwik site id'
      option :domain, 'piwik.example.org', 'Piwik domain'
      
      def after_configuration
        app.set :piwik_domain, options.domain
        app.set :piwik_id, options.id
      end

      helpers do
        def insert_piwik_tracker_img
            "<p><img src=\"https://#{piwik_domain}/piwik.php?idsite=#{piwik_id}\" style=\"border:0;\" alt=\"\" /></p>"
        end

        def insert_piwik_tracker_js
            <<END
        <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
        var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{piwik_domain}/";
        _paq.push(['setTrackerUrl', u+'piwik.php']);
        _paq.push(['setSiteId', #{piwik_id}]);
        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
        g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
        </script>
END
        end

        def insert_piwik_tracker
            insert_piwik_tracker_js + "<noscript>" + insert_piwik_tracker_img + "</noscript>"
        end
      end
    end
  end
end 
