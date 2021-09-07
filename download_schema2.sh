#!/bin/sh

get-graphql-schema https://graphql.kvest.simpleapps.site/v1/graphql --header "Authorization=Bearer $1" > schema.graphql