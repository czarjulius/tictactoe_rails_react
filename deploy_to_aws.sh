 #!/bin/bash
 
echo 'Starting to Deploy...'
ssh -i "tictactoeaws.pem" ubuntu@54.202.2.231 "cd tictactoe_rails_react 
        sudo docker-compose down
        git pull origin develop -f 
        "
#     docker-compose down && docker-compose up -d
#     docker exec -it postgres bash && su - postgres && create database tictactoe\; && \q 
#     docker-compose run web bundle exec rake db:migrate
#     "









#  git pull origin develop -f \
# ssh -i "tictactoeaws.pem" ubuntu@54.202.2.231 "cd tictactoe_rails_react &&  docker-compose up"
#     docker-compose down
#     docker-compose up -d
#     docker exec -it postgres bash && su - postgres && create database tictactoe\; && \q
#     docker-compose run web bundle exec rake db:migrate
#     docker-compose up
#     docker-compose build
#     docker-compose run web bundle exec rake db:create && docker-compose run web bundle exec rake db:migrate
# "