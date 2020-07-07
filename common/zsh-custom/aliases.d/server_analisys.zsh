alias -g Mn='-t "reset; while true; do clear; curl -s http://localhost/nginx_stub_status; sleep 5; done"'
alias -g Mn1='-t "reset; sudo tail -f /var/log/nginx/access.log | egrep --color '"'"'HTTP/1.1\" (5..|4..)'"'"'"'
alias -g Mn2='-t "reset; sudo tail -f /var/log/nginx/access.log | egrep --color '"'"'HTTP/1.1\" 503'"'"'"'
# fail2ban-client set nginx-req-limit banip {ip}
# grep HEAD /var/log/nginx/access.log | egrep -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq -c | sort -nr | head
# grep HEAD /var/log/nginx/access.log | egrep -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq -c | sort -nr | head
# tail -f /var/log/nginx/error.log
alias -g Mn3='-t "reset; sudo tail -f /var/log/nginx/access.log | grep '"'"' HTTP/1..\" 400'"'"'"'
alias -g Mip='-t "reset; while true; do clear; sudo grep `echo date +'"'"'%d/%b/%Y:%H'"'"'` /var/log/nginx/access.log | awk '"'"'{print $1}'"'"' | sort | uniq -c | sort -nr | head; sleep 5; done"'
alias -g Mua='-t "reset; sudo awk -F'"'"'\"'"'"' '"'"'/GET/ {print $6}'"'"' /var/log/nginx/access.log | cut -d'"'"' '"'"' -f1 | sort | uniq -c | sort -rn | head"'
alias -g Mv='-t "reset; sudo varnishlog | egrep --color \"(RxStatus|TxStatus)\""'
alias V='varnishadm backend.list'
alias ClearNginx='cd /var/lib/nginx/cache && rm -rf {0..9} {a..f}'
