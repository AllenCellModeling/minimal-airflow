#!/usr/bin/env bash

# Defaults
WORK_DIR="$(dirname "$PWD")"  # Change this to the parent path for airflow dags, wrappers, and docker files
LAUNCH_FUNCTION="bash"

# Help string that keeps formatting
read -r -d '' HELP_STRING <<- EOM
    minimal_airflow docker usage:

        -d      | --work-directory      the path to the repository directory (Default: $WORK_DIR)
        -b      | --launch-bash         launch a bash shell (Default)
        -a      | --launch-airflow      launch the minimal_airflow pipeline
        -h      | --help                show help and usage
EOM

# Collect CLI arguments
while [ "$1" != "" ]; do
    case $1 in

        -repo | --repository-directory )            shift
                                                    WORK_DIR=$1
                                                    ;;
        -b | --launch-bash )                        LAUNCH_FUNCTION="bash"
                                                    ;;
        -a | --launch-airflow )                     LAUNCH_FUNCTION="airflow"
                                                    ;;
        -h | --help )                               echo "$HELP_STRING"
                                                    kill -INT $$
                                                    ;;
        * )                                         echo "$HELP_STRING"
                                                    kill -INT $$
    esac
    shift
done

# Did not exit run, with arguments
docker run --rm -it \
  -v $WORK_DIR:/pipeline \
  minimal_airflow \
  $LAUNCH_FUNCTION
