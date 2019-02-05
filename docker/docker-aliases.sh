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
        dc redis (runs shell for container)
        dc redis ls -lsa (executes given command)
      Commands:
        ls - dc ls (list containers)
        build - dc build (build Dockerfile)
        clean - dc clean (cleanup everything)
        stop - dc stop (stops containers)
        start - dc start (starts containers)
        restart - dc restart redis (restarts 1/N containers)
        logs - dc logs redis (shows logs for given container)
        run - dc run redis cat /proc/version (one-time command)
      '
      ;;
    'ls' )
      docker-compose ps
      ;;
    'build' )
      docker-compose build
      ;;
    'clean' )
      docker system prune -a
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
    'run' )
      docker-compose run --rm ${@:2}
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
