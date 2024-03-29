#!/bin/bash

nombre() {
    read -p "Pon un nusario: " username
    read -s -p "pon una contraseña: " contra
    echo 
}

menu() {
    clear
    echo "1. Cambiar contraseña "
    echo "2. Buscar fichero"
    echo "3. Horoscopos"
    echo "4. sEuroalmi"
    echo "5. Salir"
}

euroalmi() {
    clear
    echo "EuroAlmi: Rellenar boleto de Euromillón"

    read -p "¿Quieres introducir tus propios números y estrellas? (S/N): " choice

    if [ "$choice" == "S" ] || [ "$choice" == "s" ]; then
        read -p "Introduce 5 números (del 1 al 50) separados por espacios: " -a numeros
        read -p "Introduce 2 estrellas (del 1 al 12) separadas por espacios: " -a estrellas
    else
        # Generar números aleatorios
        numeros=($(shuf -i 1-50 -n 5))
        estrellas=($(shuf -i 1-12 -n 2))
    fi

    # Validar números y estrellas
    for num in "${numeros[@]}" "${estrellas[@]}"; do
        if ! [[ "$num" =~ ^[0-9]+$ ]]; then
            echo "Error: Introduce solo números válidos."
            return
        fi
    done

    echo -e "\nNúmeros seleccionados: ${numeros[@]}"
    echo "Estrellas seleccionadas: ${estrellas[@]}"

    # Números premiados (simulación)
    numeros_premiados=($(shuf -i 1-50 -n 5))
    estrellas_premiadas=($(shuf -i 1-12 -n 2))

    echo -e "\nNúmeros premiados: ${numeros_premiados[@]}"
    echo "Estrellas premiadas: ${estrellas_premiadas[@]}"

    # Calcular aciertos
    aciertos_numeros=($(comm -12 <(printf "%s\n" "${numeros[@]}" | sort) <(printf "%s\n" "${numeros_premiados[@]}" | sort)))
    aciertos_estrellas=($(comm -12 <(printf "%s\n" "${estrellas[@]}" | sort) <(printf "%s\n" "${estrellas_premiadas[@]}" | sort)))

    echo -e "\nAciertos en números: ${aciertos_numeros[@]}"
    echo "Aciertos en estrellas: ${aciertos_estrellas[@]}"

    total_aciertos=$((${#aciertos_numeros[@]} + ${#aciertos_estrellas[@]}))

    echo -e "\nTotal de aciertos: $total_aciertos"

    # Premios (simulación)
    case $total_aciertos in
        0)
            echo "No has acertado ningún número ni estrella. ¡Suerte la próxima vez!"
            ;;
        1|2)
            echo "¡Has ganado un premio pequeño!"
            ;;
        3|4)
            echo "¡Felicidades! Has ganado un premio moderado."
            ;;
        5|6)
            echo "¡Increíble! Has ganado un gran premio."
            ;;
        *)
            echo "¡Enhorabuena! Has ganado el premio máximo."
            ;;
    esac

    read -p "¿Quieres jugar otro boleto? (S/N): " jugar_otro

    if [ "$jugar_otro" == "S" ] || [ "$jugar_otro" == "s" ]; then
        euroalmi
    else
        echo "¡Gracias por jugar al EuroMillón!"
    fi
}

cambiar(){

while true; do
    read -s -p "Ingrese su contraseña antigua: " contraant
    echo

    if [ "$contraant" == "$contra" ]; then
        read -s -p "Ingrese su nueva contraseña: " new_contra
        echo
        menu
        password=$new_contra
        echo "Contraseña cambiada con exito."
    else
        echo "Contraseña antigua incorrecta. No se pudo cambiar la contraseña."
    fi

done

}


fichero (){
    until [ "$let" == "x" ] || [ "$let" == "X" ]; do
        read -p "Una letra para buscar ficheros (X para salir): " let

        if [ "$let" != "x" ] && [ "$let" != "X" ]; then
            found_encontrado=$(find . -maxdepth 1 -type f -name "${let}*")
            
            if [ -n "$found_encontrado" ]; then
                echo -e "Ficheros que comienzan con la letra '$let':\n$found_encontrado"
                
                for file in $found_encontrado; do
                    size=$(du -h "$file" | cut -f1)
                    echo "Tamaño de $file: $size"
                done
            else
                echo "No se encontraron ficheros que comiencen con la letra '$let'."
            fi
        fi
    done
}

horos(){
    read -p "Introduce tu Mes de nacimiento (1-12)" mes

    read -p "Introduce tu Dia de nacimiento (1-31)" dia 

    case $mes in
        1)
            if ((dia >= 1 && dia <= 20)); then
                echo "Capricornio"
            else
                echo "Acuario"
            fi
            ;;
        2)
            if ((dia >= 1 && dia <= 18)); then
                echo "Acuario"
            else
                echo "Piscis"
            fi
            ;;
        3)
            if ((dia >= 1 && dia <= 20)); then
                echo "Piscis"
            else
                echo "Aries"
            fi
            ;;
        4)
            if ((dia >= 1 && dia <= 20)); then
                echo "Aries"
            else
                echo "Tauro"
            fi
            ;;
        5)
            if ((dia >= 1 && dia <= 21)); then
                echo "Tauro"
            else
                echo "Géminis"
            fi
            ;;
        6)
            if ((dia >= 1 && dia <= 21)); then
                echo "Géminis"
            else
                echo "Cáncer"
            fi
            ;;
        7)
            if ((dia >= 1 && dia <= 22)); then
                echo "Cáncer"
            else
                echo "Leo"
            fi
            ;;
        8)
            if ((dia >= 1 && dia <= 23)); then
                echo "Leo"
            else
                echo "Virgo"
            fi
            ;;
        9)
            if ((dia >= 1 && dia <= 23)); then
                echo "Virgo"
            else
                echo "Libra"
            fi
            ;;
        10)
            if ((dia >= 1 && dia <= 23)); then
                echo "Libra"
            else
                echo "Escorpio"
            fi
            ;;
        11)
            if ((dia >= 1 && dia <= 22)); then
                echo "Escorpio"
            else
                echo "Sagitario"
            fi
            ;;
        12)
            if ((dia >= 1 && dia <= 21)); then
                echo "Sagitario"
            else
                echo "Capricornio"
            fi
            ;;
        *)
            echo "Mes inválido"
            ;;
    esac
}

euroalmi{
        for

}


nombre

while true; do
  menu

    echo Bienvenido $username
    read -p "Elige (1-3): " opc

    case $opc in
        1)
            cambiar
            ;;
        2)
            fichero
            ;;
        3)
            horos
            ;;

        4)
            euroalmi
            ;;
        5)
            echo "saliendooo.. adios , $username!"
            exit 0
            ;;
        *)
            echo "opcion invalida. elige un numero de 1 a 5."
            ;;
    esac

    read -p "PPulsa enter para continuador"
done

