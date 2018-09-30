#!/bin/bash

function parseArgs() {
    for var in "$@"
    do
        # echo " ******************** "
        IFS='=' read -ra addr <<< "$var"
        # echo "0: ${addr[0]}"
        # echo "1: ${addr[1]}"
        case ${addr[0]} in
            --from)
                # echo "Source Database"
                from_db=${addr[1]}
                ;;
            --to)
                # echo "Destination Database"
                to_db=${addr[1]}
                ;;
            --db_profile)
                # echo "Profile to load"
                profile=${addr[1]}
                ;;
            --db_properties)
                # echo "path to a different properties file"
                prop_path=${addr[1]}
                ;;
            *)
                echo -e "Ignoring unrecogonised command-line argument: ${LIGHT_BLUE}${var}${NC}"
        esac
        #echo "Argument: $var"
        #echo " ******************** "
    done
}

function returnArgs() {
    # declare -A returned
    returned=()
    for var in "$@"
    do
        IFS='=' read -ra arg <<< "$var"
        if [ "${arg[0]:0:2}" == "--" ] ; then
            arg[0]="${arg[0]:2}"
        fi
        key="${arg[0]}"
        if [ "${#arg[@]}" == "1" ] ; then
            value="true"
        else
            value="${arg[1]}"
        fi
        printf -v "${key}" "${value}"
    done
}