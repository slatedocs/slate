#!/usr/bin/env bash

CURRENTTIME=$(date +%s)

curl  -X POST -H "Content-type: application/json" \
-d "{ \"series\" :
         [{\"metric\":\"circleci.deployment.$GLOBAL_ENV\",
          \"points\":[[$CURRENTTIME, 1]],
          \"type\":\"count\",
          \"tags\":[\"environment:$GLOBAL_ENV\", \"service:$CIRCLE_PROJECT_REPONAME\"]}
        ]
}" "https://api.datadoghq.com/api/v1/series?api_key=$DATADOG_API_KEY"
