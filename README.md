# docker-odoo-nginx

An image that includes a configuration file set up to run with Odoo.

The configuration file should work from Odoo 8.0 to 12.0 and up.

## Configuration

### Odoo host name

By default, nginx is configured to proxy pass on the host named "odoo".
This can be changed with the environment variable `NGX_ODOO_HOST`.

### Odoo longpolling port

By default, nginx is configured to use the default port 8072 for longpolling.
This can be changed with the environment variable `NGX_ODOO_LONGPOLLING_PORT`.


### Proxy cache size

By default, nginx is configured to proxy cahce of 10m.
This can be changed with the environment variable `NGX_CACHE_SIZE`.


### Odoo long polling port 

By default, nginx is configured to root longpolling url on port 8072.
This can be changed with the environment variable `NGX_ODOO_LONGPOLLING`

### Odoo pdfcontent issue

In some casesthe pdfjs cannot compute the byte_content
correctly, to fix the issue, we deactivate this issue on nginx
(More info: https://github.com/camptocamp/docker-odoo-nginx/pull/29)
This can be activated with the environment variable `NGX_ODOO_PDFCONTENT`



### HTTP accesses

Custom access allow/deny can be configured using the environment variable `NGX_HTTP_ACCESS` with using a multiline content such as:

```
deny 192.168.1.1;
allow 192.168.1.0/24;
deny all;
```

### HTACCESS

You can restrict access to one or more specific location using environment variable `NGX_ODOO_EXTRA_LOCATION` such as:

```
['/products/catalog']
```
or multiple locations
```
['/products/catalog','/stock/locations']
```


you must use environment variable `NGX_HTPASSWD` to set user/password 

you will need htpasswd to generate users/password, it's present in package apache2_utils
```
sudo apt-get install apache2_utils
```
htpasswd syntax:
```
htpasswd -nb <LOGIN> <PASSWORD>
htpasswd -nb vrenaville camptocamp
```
set the result in the variable 'NGX_HTPASSWD' ex:
```
vrenaville:$apr1$lDdea9Jt$DAJQG0W1s4JEuuVQQxiur.
```

### Secure cookies

If you want all cookies to be have the Secure attribute, then you can set the
environment variable NGX_ODOO_SECURE_COOKIES to 1.
