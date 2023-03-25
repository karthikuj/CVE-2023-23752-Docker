docker-compose up -d
sleep 15

curl -s -v 'http://localhost:8080/installation/index.php' &> response
CSRF=`cat response | grep -Po "csrf.token\":\"[a-z0-9]+\"" | grep -Po "[a-z0-9]{32}"`
COOKIE=`cat response | grep -Po "Set-Cookie: [a-z0-9]+=[a-z0-9]+;" | grep -Po "[a-z0-9]+=[a-z0-9]+"`

TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.dbcheck&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$CSRF=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`
  
TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.create&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`
  
TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.populate1&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`
  
TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.populate2&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`

TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.populate3&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`

TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.custom1&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`

TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.custom2&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`
  
TOKEN=`curl -s 'http://localhost:8080/installation/index.php?task=installation.config&format=json' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw "jform%5Bsite_name%5D=example.com&jform%5Badmin_user%5D=example&jform%5Badmin_username%5D=example&jform%5Badmin_password%5D=example%401234&jform%5Badmin_email%5D=example%40example.com&jform%5Bdb_type%5D=mysqli&jform%5Bdb_host%5D=joomladb%3Amysql&jform%5Bdb_user%5D=root&jform%5Bdb_pass%5D=example&jform%5Bdb_name%5D=joomla_db&jform%5Bdb_prefix%5D=b3aqs_&jform%5Bdb_encryption%5D=0&jform%5Bdb_sslkey%5D=&jform%5Bdb_sslcert%5D=&jform%5Bdb_sslverifyservercert%5D=0&jform%5Bdb_sslca%5D=&jform%5Bdb_sslcipher%5D=&jform%5Bdb_old%5D=backup&admin_password2=example%401234&$TOKEN=1" \
  --compressed | grep -Po "\"token\":\"[a-z0-9]{32}\"" | grep -Po "[a-z0-9]{32}"`

curl -s 'http://localhost:8080/installation/index.php?view=remove&layout=default' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H "Cookie: $COOKIE" \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --compressed > /dev/null

sleep 5
curl -s -v 'http://localhost:8080/installation/index.php' &> response
CSRF=`cat response | grep -Po "csrf.token\":\"[a-z0-9]+\"" | grep -Po "[a-z0-9]{32}"`
COOKIE=`cat response | grep -Po "Set-Cookie: [a-z0-9]+=[a-z0-9]+;" | grep -Po "[a-z0-9]+=[a-z0-9]+"`

curl -s 'http://localhost:8080/installation/index.php?task=installation.removeFolder&format=json' \
  -X 'POST' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 0' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H "Cookie: $COOKIE" \
  -H 'Origin: http://localhost:8080' \
  -H 'Referer: http://localhost:8080/installation/index.php' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  -H $'X-Ajax-Engine: Joomla\u0021' \
  -H "X-CSRF-Token: $CSRF" \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --compressed > /dev/null

rm ./response

echo -e "\nCongratulations! Your Joomla site is ready.\n"