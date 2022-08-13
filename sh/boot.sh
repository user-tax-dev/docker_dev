up="docker-compose up -d"

if [ $EUID != 0 ]; then
  echo -e "\n> sudo $up"
  sudo "$0" "$@"
  exit $?
fi

DIR=$(dirname $(dirname $(realpath "$0")))
cd $DIR

set -ex

if ! [ -x "$(command -v docker-compose)" ]; then
pip3 install docker-compose
fi

name=$(basename $0)

lang=${name%.*}

sed "s/dev_ubuntu_lang/dev_ubuntu_$lang/" template.yml | tee docker-compose.yml

exec sh -c "$up"

