#!/bin/bash

case ${1,,} in
    jorda | admin)
        echo "eres el jefe hola!!"
        ;;
    help)
        echo "escribeeee!!"
        ;;
    *)
        echo "No eres el jefe, entra un nombre valido!!"
        ;;
esac