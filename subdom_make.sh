#!/bin/bash
source .env

TIMEWEB_CLOUD_TOKEN="${APIKEY}"
SUBDOMAIN="$1"

RESPONSE_add=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TIMEWEB_CLOUD_TOKEN" \
  "https://api.timeweb.cloud/api/v1/domains/${DOMAIN}/subdomains/${SUBDOMAIN}")

# ---
HEAD_dns="{\"type\":\"A\",\"value\":\"${IP_ADDRESS}\"}"
RESPONSE_dns=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TIMEWEB_CLOUD_TOKEN" \
  -d "${HEAD_dns}" \
  "https://api.timeweb.cloud/api/v1/domains/${SUBDOMAIN}.${DOMAIN}/dns-records")

# ---
echo "----Создание----"
CODE=$(echo "$RESPONSE_add" | jq -r '.status_code')
echo "----Добавление DNS----"
CODE=$(echo "$RESPONSE_dns" | jq -r '.status_code')
if [[ $CODE == 'null' ]]; then
  echo "Поддомен ${SUBDOMAIN}.${DOMAIN} успешно создан."
elif [[ $CODE == '409' ]]; then
  echo "Ошибка ${SUBDOMAIN}.${DOMAIN} уже существует."
fi
echo "--------"