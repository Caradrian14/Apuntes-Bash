# Bash Script Documentación

## Que es Bash?
Es una shell de linux, o terminal para Unix. Es la shell ma spopular de linux  y tiene mucho recorrido. Se puede usar en mac y en Windows con el subsytem for linux instalado en el.
NO se puede hacer programacion orientada a objetos y no vale la pena usarlo para scripts complejos, solo para automatismos simples. Hay otras herramientas como **Ansible** que tambien estan en python.


`echo Hola` imprime hola

`cat fichero_simple.txt` imprime el contenido de 'fochero_simple.txt'

`pwd` comando para saber la ruta del archivo actual

`echo $SHELL` indica que terminal estamos usando 

-  Aunque tengamos el fichero .sh creado no esta marcado como ejecutable aun. Debido a que a la hora de crear nuevos ficheros no se crean como ejecutables por default en linux.

Recordatorio: para ver los permisos de linux usar `ls -l`

`chmod u+x shelltest.sh ` Para dar permiso de ejecucion al ejecutable.

Ahora ya podemos realizar scripts ejecutables 

## variables
Para definir variables se usa `NOMBRE_VARIABLE=string`

para despues usar la variable se usa `$NOMBRE_VARIABLE`

## inputs string

`read PRIMER_NOMBRE`con el comando 'read' permite captar inputs de tipo string. de ahi los podemos guardar en una variable y usarlos en otro sitio.

## Argumetos de posicion
Permite argumentos que tengan posiciones concretas en base a variables, asumiendo qu etienes las variables `$1` `$2` y se usan los argumentos en la llamada de la variables: 
`./scriptArgumentosPosicion3.sh Adria Jorda` en la terminal estas paralbras se entenderan como variables

## Output 
Piping, se usa para enviar los outputs de comandos a otros comandos. Se pueden usar para crear variables de entorno dinamicas.

`wc -w fichero_simple.txt` el comando en terminal permite contar el numero de palabras, pero en el output sale tambien el nombre del archivo.

`wc -w < fichero_simple.txt` Aqui lo qu ehacemos es redireccionar el contenido en si de fichero, obteniendo como outpur el numero solo de palabras sin el titulo.

## Igualdades/booleanos
si ejecutamos en terminal `[ hello = hello ]` y luego ejecutamos `echo = $?` obtenemos `0` que viene a significar que **no ha habido problemas en la ejecucion**

Sin embargo cuando ejecutamos  `[ 1 = 0 ]` y volvemos a usar `echo = $?` obtenemos `1` que viene a decir que algo no ha ido bien en la igualdad.


## If / else 
 ejemplo simple de if en bash:
```bash
if [ "${1,,}" = "jorda" ]; then
    echo "eres tuuuu"
elif [ "${1,,}" = "help" ]; then
    echo "Escribe tu nombre loco"
else
    echo "Quien eres tu? no eres mi novia!!!"
fi
```

## switch Case
```bash
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
```


## Arrays
`MY_FIRS_ARRAY=(uno dos tres cuatro cinco)` este es un ejemplo sencillo de como definir un array sencillo.

El problema esta en que cuando tratamos de hacer un echo como `echo $MY_FIRS_ARRAY` solo se imprime el primer argumento y no queremos eso, queremos todo!!!

para imprimir todo usaremos un bucle, para ello usaremos; `echo ${MY_FIRS_ARRAY[@]}` para que asi se imprima todo .

Tambien podemos definir que argumentos usamos para que aparezca como en los array normales: `echo ${MY_FIRS_ARRAY[0]}`

## For Loops
definimos primero el array : `MY_FIRST_ARRAY=(uno dos tres cuatro cinco)`
y despues hacemos un contador de caracteres`for item in ${MY_FIRST_ARRAY[@]}; do echo -n  $item | wc -c; done`

## Funciones

```bash
up="before"
since="function"
echo $up
echo $since
showuptime(){
    local up=$(uptime -p | cut -c4-)
    local since=$(uptime -s)
    cat << EOF
-----
Esta maquina ha sido levantada por ${up}
se ha corrido desde ${since}
-----
EOF
}
```

El uso de la palabra local permite que las variables sean locales y no se sobrescriban.

## AWK
obtener el output como queremos. Es un comando de terminal la palabra concreta como si fuera un array de una frase
si en un fichero `testfile.txt`hay escrito `uno dos tres cuatro`

y ejecutamos `awk '{print $1}' testfile.txt` se pbtentra `uno`
y si ejecutamos `awk '{print $2}' testfile.txt` se pbtentra `dos`

si queremos personalizar el separador, como una coma de tal modo que `testfile.csv`hay escrito `uno,dos,tres,cuatro`

podemos indicarlo con `awk -F, '{}print $1' testfile.csv`

hay muchos awk comandos que no se ha visto pero son interesantes para personalizar las salidas de los comandos.

## SED
Si se quiere cambiar valores en textos concretos se puede  usar el comando sed, para ello
asumamos que tenemos un texto en el fichero `comentario.text` y queremos cambiar una palabra, para ellos usamos:
`sed 's/parala_a_cambiar/palabra_que_queremos/g' comentario.txt` el comando s es sutitucion y la g del final es para que sea global
