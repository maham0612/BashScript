#!/bin/bash

Docker_username="maham0612"
img_name="iac_web"
nginx_img="nginx"

#remove images and containers
#sudo docker stop $(sudo docker ps -a -q)
#sudo docker rm $(sudo docker ps -a -q)
#sudo docker rmi $(sudo docker image ls -q)

# check if image does not exists locally
if [ -z "$(sudo docker image ls -q ${Docker_username}/${img_name})" ]; then
        echo "Image does not exist locally" 


	#check if image exists remotely
	if  sudo docker pull "$Docker_username/$img_name"; then
		echo "Creating Container..."
		sudo docker run -d --name "darkvenom" -p 8081:80 $Docker_username/$img_name
                 

	#image does not  exist remotely
        else
		echo "Image exists on docker hub but not locally"
		echo "Image Does not exists remotely"
                sudo docker pull nginx:latest
                echo "Creating container..."
                sudo docker run -d --name "darkvenom" -p 8081:80 nginx:latest

                echo "Installing apt..."
                sudo docker exec darkvenom apt-get update -y
                echo "Installing git..."
                sudo docker exec darkvenom apt-get install git -y

                sudo docker exec darkvenom git clone https://github.com/maham0612/iac_code.git
                echo "Moving Code..."
                sudo docker exec darkvenom bash -c "cp -r /iac_code/* /usr/share/nginx/html/"

                echo "Making image..."
                sudo docker commit darkvenom $Docker_username/$img_name
                sudo docker push $Docker_username/$img_name:latest
	fi
else
	echo "Images exists. Check server"
fi
