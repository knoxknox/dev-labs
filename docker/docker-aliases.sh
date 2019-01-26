##
# This is functions to help to work with docker.
# You need to place this to your profile (~/.profile).
#
# Usage:
# Type `dc` in console (it outputs details and examples).
#
function dc() {
  case $1 in
    'h' )
      echo -e '
      Help:
        dc (prints how to use dc)
        dc redis (enter to the given container)
        dc redis ls -lsa (execute given command)
      Commands:
        ls - dc ls (list containers)
        build - dc build (build Dockerfile)
        stop - dc stop (stop containers)
        start - dc start (start containers)
        restart - dc restart redis (restart 1/N containers)
        logs - dc logs redis (show logs for given container)
      '
      ;;
    'ls' )
      docker-compose ps
      ;;
    'build' )
      docker-compose build
      ;;
    'stop' )
      docker-compose stop
      ;;
    'start' )
      docker-compose up -d
      ;;
    'restart' )
      docker-compose restart $2
      ;;
    'logs' )
      docker-compose logs -f $2
      ;;
    * )
      if [ -z "$1" ]; then
        dc h
      else
        args=${@:2}
        docker exec -it $1 ${args:-/bin/bash}
      fi
      ;;
  esac
}
