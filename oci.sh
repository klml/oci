#!/bin/bash
# [openshift cli](https://docs.openshift.com/container-platform/latest/cli_reference/openshift_cli/developer-cli-commands.html) with a little bit more idempotence
case "$1" in
"expose" )
    oc get routes $3 2> /dev/null || oc $@ ;;
"new-app" )
    oc get services $3 2> /dev/null || oc $@ ;;
"new-build" )
    oc get build $3 2> /dev/null || oc $@ ;;
* ) ## pipe all other oc commands to oc 
    oc $@ ;;
esac
