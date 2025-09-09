#!/bin/bash

BORDO='\033[0;31m'      # czerwony
POMARA='\033[0;33m'     # pomarańczowy/żółty
NC='\033[0m'            # reset koloru
FOLDER_PATH="C:/Users/s.medrala/Desktop/logs"

search_logs() {
    local search_type="$1"

    echo -e "${BORDO}=========== Rozpoczęcie przeszukiwania: $search_type ===========${NC}"

    for file_path in "$FOLDER_PATH"/*.log "$FOLDER_PATH"/*.txt; do
        # sprawdzenie czy plik istnieje
        if [ ! -f "$file_path" ]; then
            continue
        fi

        echo -e "${BORDO}Plik: $file_path${NC}"

        # wyciągnięcie ostatniego timestampu z pliku
        last_timestamp=$(grep -oE '\[[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}\+[0-9]{4}\]' "$file_path" | tail -n 1)

        case $search_type in
            error)
                grep -Ei "error|exception|warning" "$file_path" | grep -Ev "level|appID|environment" | while read -r line; do
                    echo -e "\n${BORDO}====================${NC}"
                    echo "$line"
                    if [ -n "$last_timestamp" ]; then
                        echo -e "${POMARA}Ostatni timestamp w pliku: $last_timestamp${NC}"
                    fi
                    echo -e "${BORDO}====================${NC}\n"
                done
                ;;
            cert)
                grep -i "certificate" "$file_path" | grep -Ev "level|appID|environment" | while read -r line; do
                    echo -e "\n${BORDO}====================${NC}"
                    echo "$line"
                    if [ -n "$last_timestamp" ]; then
                        echo -e "${POMARA}Ostatni timestamp w pliku: $last_timestamp${NC}"
                    fi
                    echo -e "${BORDO}====================${NC}\n"
                done
                ;;
            *)
                echo -e "${BORDO}Nieznana komenda: $search_type. Użyj 'error' lub 'cert'.${NC}"
                exit 1
                ;;
        esac
    done

    echo -e "${BORDO}=========== Koniec przeszukiwania ===========${NC}"
}

read -p "Wpisz 'error' lub 'cert' aby przeszukiwać pliki: " command
search_logs "$command"
