# docker-liquibase


Docker image with Liquibase installation for use with postgres databases

The variables should be set as follows:

$LB_CONTAINER - the name of the docker container  
$DB_IP - the IP address of the target database  
$DB_NAME - the target database name  
$DB_USER - the user to the target database  
$DB_PASS - password to the target database  
$LB_CHANGELOGS - volume on the host machine, where the generated file will be written  

By running the command above , you'll get on the volume:

1. a new changelog file with the diff results
2. the new changelog file included in the provided include-file

## Prequesite

Create your own docker file and add the your changelogs to the /changelogs folder or make /changelogs a shared volume.

I personally create a Project db-migrate with a Dockerfile that is base on this one. 
This project includes a folder changelogs with the changelogs specific to the database. 
I push the db-migrate project into my private registry.

In the database-project I have a docker-compose file that links the db-migrate image. On an update on the db-migrate project. 
The CI runs docker-compose run db-migrate on the database-project. 
Before this happens the database should be secured. I run one off command to create a dump.

I will describe this process more in details. At moment this process is still in development

#### update
Use the updated script update.sh to update a datbase container
 
   docker run --name $CONTAINER_NAME --link $LB_CONTAINER:db -v $LB_CHANGELOGS:/changelogs -e LB_CHANGELOG_FILE=/changelogs/changelog1.xml -e LB_DB_NAME=$LB_DB_NAME --rm  --entrypoint="/scripts/liquibase_command.sh" liquibase "update"

### Original Version
https://github.com/sequenceiq/docker-liquibase