#stop
docker stop mysite
docker ps -a
docker rm mysite
docker ps -a
docker pull oneal43/mysite:latest
docker images
docker run -d -p 8080:80 --name newsite oneal43/project5
