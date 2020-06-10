 #!/bin/bash
 
echo 'Starting to Deploy...'
ssh -i "tictactoeaws.pem" -o StrictHostKeyChecking=no ubuntu@52.38.40.75 " sudo docker image prune -f 
        cd tictactoe_rails_react 
        sudo docker-compose down
        git fetch origin
        git reset --hard origin/develop  &&  echo 'You are doing well'
        sudo docker-compose build && sudo docker-compose up -d
        "
echo 'Deployment completed successfully'
