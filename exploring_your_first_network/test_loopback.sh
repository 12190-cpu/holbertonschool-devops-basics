#!/usr/bin/env bash
ping -c 4 "$(ip -4 -brief address show scope host | head -n 1 | tr -s ' ' | cut -d ' ' -f 3 | cut -d '/' -f 1)"