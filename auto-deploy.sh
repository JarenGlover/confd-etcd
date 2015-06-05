#!/bin/bash


read -p "Please enter Digital Oceans dev TOKEN followed by ENTER: " TOKEN

read -p "Please enter your an SSH_ID followed by ENTER: " SSH_KEY_ID

# To use below command to get your SSH_KEY_ID

#curl --request GET "https://api.digitalocean.com/v2/account/keys" \
#     --header "Authorization: Bearer $TOKEN"


echo "We are about to spin up some nodes"
echo "I often pipe the results to jq binary"

#for name in 'core-4'
for name in 'core-2' 'core-3' 'core-1'
do
    curl --request POST "https://api.digitalocean.com/v2/droplets" \
         --header "Content-Type: application/json" \
         --header "Authorization: Bearer $TOKEN" \
         --data '{
          "region":"nyc3",
          "image":"coreos-stable",
          "size":"512mb",
          "name":"'$name'",
          "private_networking":true,
          "ssh_keys":['$SSH_KEY_ID'],
          "user_data": "'"$(cat cloud-config.yaml | sed 's/"/\\"/g')"'"
          }'
done

echo ""
