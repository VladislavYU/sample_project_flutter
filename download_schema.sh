#!/bin/sh

ENDPOINT=https://graphql.sample.simpleapps.site/v1/graphql
apollo client:download-schema schema.graphql --endpoint ${ENDPOINT} --header "Authorization: Bearer $1"
# apollo client:download-schema schema.graphql --endpoint ${ENDPOINT} --header "x-hasura-admin-secret: x8uR5rtSFRrRZdjU"
