 #!/bin/bash
 
echo 'Starting to Deploy...'
ssh -i "tictactoeaws.pem" ubuntu@52.38.40.75 "cd tictactoe_rails_react 
        sudo docker-compose down && cd ..
        sudo rm -rf tictactoe_rails_react && sudo docker image prune -f
        git clone https://github.com/czarjulius/tictactoe_rails_react.git && cd tictactoe_rails_react && echo 'You are doing well'
        sudo docker-compose build && sudo docker-compose up -d
        "
echo 'Deployment completed successfully'
