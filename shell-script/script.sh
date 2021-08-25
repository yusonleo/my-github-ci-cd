# version
ie-app-publisher-linux -V

# workspace
echo "-----------------------------------------INIT WORKSPACE-----------------------------------------"
mkdir workspace 
cd workspace 
ie-app-publisher-linux ws i

# Connection to docker engine 
echo "-----------------------------------------CONNECT TO DOCKER ENGINE-----------------------------------------"
ie-app-publisher-linux de c -u http://localhost:2375

# Portal login and logout 
echo "-----------------------------------------IEM LOGIN-----------------------------------------"
export IE_SKIP_CERTIFICATE=true
ie-app-publisher-linux em li -u <iem-url> -e <username> -p <password>

# Create applications version 
echo "-----------------------------------------UPLOAD APP TO IEM-----------------------------------------"
ie-app-publisher-linux em app cuv -a <appID> -v <version> -y <path-to-docker-compose-file> -n '{"hello-edge":[{"name":"hello-edge","protocol":"HTTP","port":"80","headers":"","rewriteTarget":"/"}]}' -s 'hello-edge' -t 'FromBoxReverseProxy' -u "hello-edge" -r "/"
ie-app-publisher-linux em app uuv -a <appID> -v <version> 



