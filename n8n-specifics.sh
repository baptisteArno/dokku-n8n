#!/bin/bash

##node reload-workflows.js
#workflows=(2 14 7 10 11 12)
#
#for i in "${workflows[@]}"
#do
#   :
#   echo "http://localhost:5678/rest/workflows/$i"
#   curl "http://localhost:5678/rest/workflows/$i" -s -X 'PATCH'  -H 'Accept: application/json, text/plain, */*'  -H 'Content-Type: application/json;charset=UTF-8'    --data-raw '{"active":false}' -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD > /dev/null
# #  curl "http://localhost:5678/rest/workflows/$i" -s -X 'PATCH'  -H 'Accept: application/json, text/plain, */*'  -H 'Content-Type: application/json;charset=UTF-8'    --data-raw '{"active":true}' -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD > /dev/null
#   curl "http://localhost:5678/rest/workflows/$i"   -H 'Accept: application/json, text/plain, */*'  -H 'Content-Type: application/json;charset=UTF-8' -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD > /dev/null
#done
##curl "http://localhost:5678/rest/workflows/run" -s -X 'POST'  -H 'Accept: application/json, text/plain, */*'  -H 'Content-Type: application/json;charset=UTF-8'    --data-raw '{"workflowData": {"id":18}}' -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD > /dev/null
##curl "http://localhost:5678/rest/workflows/18" -s -X 'GET'  -H 'Accept: application/json, text/plain, */*'  -H 'Content-Type: application/json;charset=UTF-8'     -u $N8N_BASIC_AUTH_USER:$N8N_BASIC_AUTH_PASSWORD > /dev/null

dokku enter yo web node reload-workflows.js
