#!/bin/bash
: ${LB_CHANGELOG_FILE:="/changelogs/changelog.xml"}
: ${LB_LOG_FILE:="/changelogs/liquibase.log"}

echo "Applying changes to the database. Changelog: $LB_CHANGELOG_FILE"
liquibase --changeLogFile="$LB_CHANGELOG_FILE" --logFile=$LB_LOG_FILE update
