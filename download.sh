#!/usr/bin/env bash
set -euo pipefail

last_version="$(curl https://api.github.com/repos/tlvince/capricorn-firmware/releases | jq '.[0].tag_name')"

current_firmware="$(curl --silent \
  --header 'Referer: https://en.miui.com' \
  --head 'https://update.miui.com/updates/v1/fullromdownload.php?d=capricorn&b=X&r=cn&n=' \
  | grep '^Location: ')"

current_version="$(grep -oP '\d+\.d+\.\d+' <<< "$current_firmware" | head -n1)"

[[ "$current_version" == "$last_version" ]] && exit

current_firmware_url="$(sed 's/Location: http:/https:/' <<< "$current_firmware")"
filename="${current_firmware_url##*/}"
md5="$(md5sum $filename)"
suffix="_${md5:0:10}.tgz"
build="${filename%$suffix}"

curl -O "$current_firmware_url"
tar xfv "$filename"

mkdir -p images
while read image; do
  mv "$build/images/$image" "images/$image"
done < images.txt

git tag "$current_version"

cd images
echo "$md5  $filename" > md5sums.txt
md5sum * >> md5sums.txt
cd -

mkdir mountpoint
sudo mount -o loop images/NON-HLOS.bin mountpoint
cp mountpoint/verinfo/ver_info.txt images/verinfo.json
sudo umount mountpoint
rmdir mountpoint
