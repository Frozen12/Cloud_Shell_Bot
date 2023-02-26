FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /app
WORKDIR /app
COPY . .

EXPOSE 7777

# Rclone Environment setup
ENV RCLONE_CONFIG=/app/.config/rclone.conf
ENV RCLONE_VERBOSE=1
ENV RCLONE_DRIVE_TPSLIMIT=3
ENV RCLONE_LOG_FILE=rcloneLog.txt
ENV RCLONE_PROGRESS=true
ENV RCLONE_SERVER_SIDE_ACROSS_CONFIGS=true
ENV RCLONE_CRYPT_SERVER_SIDE_ACROSS_CONFIGS=true
ENV RCLONE_IGNORE_EXISTING=true
ENV RCLONE_DRIVE_ACKNOWLEDGE_ABUSE=true
ENV RCLONE_ORDER_BY=size,ascending
ENV SA="--drive-service-account-file=/app/.config/sa-accounts/credentials.json"



RUN chmod +x setup.sh && sh setup.sh

#install megatools
#install required packages to compile source
#install dependencies for megatools experimental 1.11.0 (meson also)
# apt install meson ninja-build libglib2.0-dev libcurl4-openssl-dev build-essential libssl-dev checkinstall pkg-config cmake
# RUN git clone https://megous.com/git/megatools && cd megatools && meson b && ninja -C b && ninja -C b install && rm -rf ~/megatools

CMD ["bash", "start.sh"]
