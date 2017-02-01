#!/bin/bash
. /opt/bitnami/base/functions

print_welcome_page
check_for_updates &

exec tini -- "$@"
