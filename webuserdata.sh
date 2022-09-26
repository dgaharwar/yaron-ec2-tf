    #!/bin/bash
    echo Script Started > /tmp/script.log
    sudo systemctl start nginx
    sudo systemctl enable nginx.service
    sudo systemctl status nginx
    sudo echo "<h1>Welcome to our Demo Application!</h1>" > /tmp/welcome.html
    sudo cp /tmp/welcome.html /usr/share/nginx/html/index.html
     
    sudo systemctl reload nginx