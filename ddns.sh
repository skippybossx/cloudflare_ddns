#!/bin/bash
source ./config

cp ./request ./request_temp

sed -i -e "s/domain_owner_mail_var/$domain_owner_mail/g" ./request_temp
sed -i -e "s/domain_api_key_var/$domain_api_key/g" ./request_temp
sed -i -e "s/zone_api_id_var/$zone_api_id/g" ./request_temp
sed -i -e "s/dns_record_name_var/$dns_record_name/g" ./request_temp

bash ./request_temp

array="$(cat ./array)"
dns_record_id="$(cat ./record_id)"

IP=$(dig +short txt ch whoami.cloudflare @1.0.0.1 | grep -o '[0-9,.]*')

if [ "$IP" = "$array" ]; then
        :
else
        cp ./add_dns ./temp
	sed -i -e "s/domain_owner_mail_var/$domain_owner_mail/g" ./temp
	sed -i -e "s/domain_api_key_var/$domain_api_key/g" ./temp
	sed -i -e "s/zone_api_id_var/$zone_api_id/g" ./temp
	sed -i -e "s/dns_record_name_var/$dns_record_name/g" ./temp
        sed -i -e "s/IP_VARIABLE/$IP/g" ./temp
	sed -i -e "s/dns_record_id_var/$dns_record_id/g" ./temp
        bash ./temp
        sleep 1
        rm ./temp
fi

rm ./array
rm ./request_temp
rm ./record_id

exit 1
