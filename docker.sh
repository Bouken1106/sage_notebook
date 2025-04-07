docker run --platform linux/amd64 --rm -it \
  -p 8888:8888 \
  -e TZ=Asia/Tokyo \
  -u $(id -u ${USER}):$(id -g ${USER}) \
  -v ${PWD}:${PWD} \
  -v ${PWD}/.sage:/home/sage/.sage \
  -w ${PWD} \
  sagemath/sagemath:latest sage -n jupyter
