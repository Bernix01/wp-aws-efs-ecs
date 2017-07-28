#!/bin/ash
echo "hello";
if env | grep -q ^WP_WEBROOT=; then
	echo "Replacing nginx webroot for WordPress with environment variable: $WP_WEBROOT";
	sed -i 's#root /var/www/html;#root '$WP_WEBROOT';#' /etc/nginx/nginx.conf;
  ls -al $WP_WEBROOT;
else
  echo "derp";
fi
echo "INFO: Running /usr/bin/supervisord";
echo "\n\n";

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
exit;