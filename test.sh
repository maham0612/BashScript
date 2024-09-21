Docker_username="maham0612"
img_name="nginx_server"
nginx_img="nginx"
# check if image exists locally
if [ -z "$(sudo docker image ls -q ${Docker_username}/${img_name})" ]; then
	echo "Image does not exist"

        #check if0 image exists remotely
if sudo docker pull "$Docker_username/$img_name"; then
        echo "Image exists on docker hub but not locally"
	#image does not exists remotely
        else
                echo "Image does not exists on docker hub"
        fi
else
        echo "Images exist locally"
fi
