#!/bin/bash
source .env

TIMEWEB_CLOUD_TOKEN="${APIKEY}"
SUBDOMAIN="$1"

RESPONSE=$(curl -s -X DELETE \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TIMEWEB_CLOUD_TOKEN" \
  "https://api.timeweb.cloud/api/v1/domains/${DOMAIN}/subdomains/${SUBDOMAIN}")

# ---
echo "-------"
CODE=$(echo "$RESPONSE" | jq -r '.status_code')
if [[ $CODE == '' ]]; then
  echo "Поддомен $SUBDOMAIN.$DOMAIN успешно удалён."
elif [[ $CODE == '404' ]]; then
  echo "Ошибка ${SUBDOMAIN}.${DOMAIN} НЕ существует."
else 
  echo "Ошибка CODE: $CODE"
  echo "$RESPONSE" | jq -r '.message'
fi
echo "-------"

