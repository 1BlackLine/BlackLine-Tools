#!/bin/bash

# Define colors
NORMAL="\033[0m"
BOLD="\033[1m"
BLINK="\033[5m"
LGREEN="\033[92m"
DGRAY="\033[90m"
RED="\033[91m"
BLUE="\033[94m"
CYAN="\033[96m"
YELLOW="\033[93m"
WHITE="\033[1;37m"
GREEN="\033[0;32m"
LightRed="\033[1;31m"
RESET="\033[0m"

banner="""
 ▄▄▄▄    ██▓    ▄▄▄       ▄████▄   ██ ▄█▀ ██▓     ██▓ ███▄    █ ▓█████ 
▓█████▄ ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██▒    ▓██▒ ██ ▀█   █ ▓█   ▀ 
▒██▒ ▄██▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒██░    ▒██▒▓██  ▀█ ██▒▒███   
▒██░█▀  ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒██░    ░██░▓██▒  ▐▌██▒▒▓█  ▄ 
░▓█  ▀█▓░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░██████▒░██░▒██░   ▓██░░▒████▒
░▒▓███▀▒░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░
▒░▒   ░ ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░ ░ ░  ░
 ░    ░   ░ ░    ░   ▒   ░        ░ ░░ ░   ░ ░    ▒ ░   ░   ░ ░    ░   
 ░          ░  ░     ░  ░░ ░      ░  ░       ░  ░ ░           ░    ░  ░
      ░                  ░                                                                                
V 1.0 ~ by X Admin BlackLine
 ̿̿ ̿̿ ̿̿ ̿'̿'\̵͇̿̿\з= ( ▀ ͜͞ʖ▀) =ε/̵͇̿̿/’̿’̿ ̿ ̿̿ ̿̿ ̿̿
"""
text="${BOLD}${GREEN}${BLINK}${LBLUE}🕱 @BlackLineGROUP${DGRAY} | ${RED}Recon Tools${NORMAL}"

function print_status() {
    message=$1
    color=$2
    echo -e "${color}${message}${NORMAL}" 
}

function save_result() {
    result=$1
    output_file=$2
    echo -e "${result}" >> "${output_file}"
}

function run_subfinder() {
    domain=$1
    output_file=$2
    print_status "\n\t\t\t\t${WHITE}🕵 MENCARI SUBDOMAIN${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v subfinder &> /dev/null; then
        result=$(subfinder -d "$domain" -all -recursive -silent)
        echo -e "${LGREEN}${result}${NORMAL}" "\n" | lolcat
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status " 💥一━══デ︻▄ DITEMUKAN ${count} SUBDOMAIN ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Subfinder lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_subfinder_list() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI SUBDOMAIN DALAM LIST${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v subfinder &> /dev/null; then
        result=$(subfinder -dL "$input_file" -all -recursive -silent)
        echo -e "${LGREEN}${result}${NORMAL}" | lolcat
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status " 💥一━══デ︻▄ DITEMUKAN ${count} SUBDOMAIN ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Subfinder lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_httpx() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI SUBDOMAIN YANG AKTIF${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    if command -v httpx &> /dev/null; then
        result=$(httpx -l "$input_file" -silent)
        echo -e "${LGREEN}${result}${NORMAL}" | lolcat
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} SUBDOMAIN AKTIF ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools HTTPX lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_info() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t${WHITE}🕵 MENGUMPULKAN INFORMASI WEBSITE${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    if command -v httpx &> /dev/null; then
        result=$(httpx -l "$input_file" -silent -sc -title -td)
        echo -e "${LGREEN}${result}${NORMAL}" 
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n( ＾◡＾)っ✂ DONE BOSKUU ૮₍´˶• . • ⑅ ₎ა " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools HTTPX lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_waybackurls() {
    domain=$1
    output_file=$2
     print_status "\n\t\t\t\t${WHITE}🕵 MENCARI URL${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v waybackurls &> /dev/null; then
        result=$(waybackurls "$domain")
        echo -e "${LGREEN}${result}${NORMAL}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} URLS ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_isub() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI SUBDOMAIN PENTING${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    if command -v grep &> /dev/null; then
        result=$(cat "$input_file" | grep -E "\api|\admin|\mail|\dev|\test|\manage|\github|\beta|\jira|\staging")
        echo -e "${result}${NORMAL}" | lolcat 
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} INTRESTING SUBDOMAIN ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Grep lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_waybacks() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI URL DALAM LIST${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    print_status "Sabar ya bos, Bagian ini emang agak lama.. ദ്ദി(˵ •̀ ᴗ - ˵ ) ✧" "${GREEN}"
    if command -v waybackurls &> /dev/null; then
        result=$(cat "$input_file" | waybackurls)
        echo -e "${LGREEN}${result}${NORMAL}" 
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status " 💥一━══デ︻▄ DITEMUKAN ${count} URLS ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_dir() {
    domain=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI DIRECTORY SENSITIVE${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
     #command
     dirsearch -u "$domain" -e conf,config,bak,backup,swp,old,db,sql,asp,aspx,aspx~,asp~,py,py~,rb,rb~,php,php~,bak,bkp,cache,cgi,conf,csv,html,inc,jar,js,json,jsp,jsp~,lock,log,rar,old,sql,sql.gz,sql.zip,sql.tar.gz,sql~,swp,swp~,tar,tar.bz2,tar.gz,txt,wadl,zip,log,xml,js,json --deep-recursive --force-recursive --exclude-sizes=0B --random-agent --full-url
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status " 💥一━══デ︻▄ DITEMUKAN ${count} DIRECTORY ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
       if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
}

function run_mdir() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI DIRECTORY SENSITIVE${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
     #command
     dirsearch -l "$input_file" -e conf,config,bak,backup,swp,old,db,sql,asp,aspx,aspx~,asp~,py,py~,rb,rb~,php,php~,bak,bkp,cache,cgi,conf,csv,html,inc,jar,js,json,jsp,jsp~,lock,log,rar,old,sql,sql.gz,sql.zip,sql.tar.gz,sql~,swp,swp~,tar,tar.bz2,tar.gz,txt,wadl,zip,log,xml,js,json --deep-recursive --force-recursive --exclude-sizes=0B --random-agent --full-url
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status " 💥一━══デ︻▄ DITEMUKAN ${count} DIRECTORY ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
       if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
}

function run_xss() {
    domain=$1
    output_file=$2
     print_status "\n\t\t\t\t${WHITE}🕵 MENCARI KERENTANAN XSS${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v waybackurls &> /dev/null && command -v gf &> /dev/null && command -v uro &> /dev/null && command -v qsreplace &> /dev/null && command -v freq &> /dev/null; then
        result=$(echo "$domain" | waybackurls | gf xss | uro | qsreplace '""><img src=x onerror=alert(1);>' | freq | egrep -v 'Not')
        echo -e "${LGREEN}${result}${NORMAL}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} KERENTANAN XSS ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls,GF,Uro,qsreplace,freq lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_mxss() {
    input_file=$1
    output_file=$2
     print_status "\n\t\t\t\t${WHITE}🕵 MENCARI KERENTANAN XSS${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v waybackurls &> /dev/null && command -v gf &> /dev/null && command -v uro &> /dev/null && command -v qsreplace &> /dev/null && command -v freq &> /dev/null; then
        result=$(cat "$input_file" | waybackurls | gf xss | uro | qsreplace '"><img src=x onerror=alert(1);>' | freq | egrep -v 'Not')
        echo -e "${LGREEN}${result}${NORMAL}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} KERENTANAN XSS ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls,GF,Uro,qsreplace,freq lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function check_cors_misconfig() {
    input_file=$1
    print_status "\n\t\t\t${LightRed}CORS ${WHITE}Misconfiguration ${GREEN}Vulnerability" "${NORMAL}"
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    if [[ -f "$input_file" ]]; then
        while IFS= read -r domain; do
            domain=$(echo "$domain" | xargs)
            payload="Origin: $domain, evil.com"
            response=$(curl -s -I -H "$payload" "$domain")
            if echo "$response" | grep -q "Access-Control-Allow-Origin: $payload"; then
                print_status "VULNERABLE: ${RED}${domain} ${CYAN}PAYLOADS: ${MAGENTA}$payload" "${YELLOW}"
            else
                print_status "NOT VULNERABLE: ${GREEN}${domain} ${CYAN}PAYLOADS: ${MAGENTA}$payload" "${CYAN}"
            fi
        done < "$input_file"
    else
        print_status "PATH FILENYA BELUM DIMASUKIN WOI <(ꐦㅍ _ㅍ)>" "${LightRed}"
    fi
}

function run_nuclei() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI KERENTANAN DENGAN NUCLEI${WHITE}${BOLD}" "${WHITE}${BOLD}"
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    # Meminta tingkat kerentanan dari pengguna
    read -p "$(echo -e "${WHITE}Untuk menghindari LAG silahkan Pilih 1 tingkat kerentanan apa yang akan dicari:\n - info\n - low\n - medium\n - high\n - critical\nTingkat kerentanan: ${NORMAL}")" severity
    severity=$(echo "$severity" | tr '[:upper:]' '[:lower:]') 

    case $severity in
        info|low|medium|high|critical) ;;
        *) 
            echo -e "${RED}Minum Dulu bro, lu typo <(ꐦㅍ _ㅍ)> | Tingkat kerentanan tidak valid. Pilih salah satu dari: info, low, medium, high, critical.${NORMAL}" | lolcat
            return 
            ;;
    esac

    if command -v nuclei &> /dev/null; then
        result=$(nuclei -l "$input_file" -severity "$severity" -t "$TEMPLATE_PATH" -vv)
        echo -e "${LGREEN}${result}${NORMAL}" 
        count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "Ditemukan ${count} hasil untuk tingkat kerentanan ${severity}" "${YELLOW}"
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Nuclei lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_js() {
    print_status "\n\t\t\t🕵 MENCARI INFORMASI SENSITIVE DI URL JS🕵" "${WHITE}"
     print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
    
    # Meminta input file URL dari pengguna
    read -p "$(echo -e ${WHITE}Masukkan list URL yang sudah Anda cari: ${RESET}) " url_file
    
    # Cek apakah file URL ada
    if [[ ! -f "$url_file" ]]; then
        echo -e "${WHITE}${BOLD}File tidak ditemukan ૮₍˶ ╥ ‸ ╥ ⑅₎ა: $url_file${RESET}"
        return
    fi

    # Eksekusi perintah yang diperlukan
    cat "$url_file" | grep -E "\.js$" >> jss.txt
    cat jss.txt | while read url; do 
        python3 "$TOOLS_PATH" -i "$url" -o cli | tee -a secret.txt
    done | lolcat
     print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
}


function run_or() {
    domain=$1
    output_file=$2
     print_status "\n\t\t\t\t${WHITE}🕵 MENCARI KERENTANAN OPEN REDIRECT${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    if command -v waybackurls &> /dev/null && command -v grep &> /dev/null && command -v qsreplace &> /dev/null; then
        result=$(cat "$domain" | waybackurls | grep -a -i \=http | qsreplace 'http://evil.com' | while read host do;do curl -s -L $host -I | grep "http://evil.com" && echo -e "$host \033[0;31mVulnerable\n" ;done)
        echo -e "${LGREEN}${result}${NORMAL}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n💥一━══デ︻▄ DITEMUKAN ${count} KERENTANAN OPEN REDIRECT ▄︻デ══━一💥 " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls,GF,Uro,qsreplace,freq lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}


function run_msql() {
    input_file=$1
    output_file=$2
    print_status "\n\t\t\t${WHITE}🕵 MENCARI KERENTANAN SQL INJECTION${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    print_status "Sabar ya bos, Bagian ini emang agak lama.. ദ്ദി(˵ •̀ ᴗ - ˵ ) ✧" "${GREEN}"
    if command -v cat &> /dev/null && command -v gau &> /dev/null && command -v urldedupe &> /dev/null && command -v sqlmap &> /dev/null; then
        result=$(cat "$input_file" | gau | urldedupe |
gf sqli >sql.txt; sqlmap -m sql.txt --batch --dbs --risk 2 --level 5 --random-agent )
        echo -e "${WHITE}${result}${NORMAL}${WHITE}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n( ＾◡＾)っ✂ DONE BOSKUU ૮₍´˶• . • ⑅ ₎ა " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls,GF,Uro,qsreplace,freq lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

function run_sql() {
    domain=$1
    output_file=$2
     print_status "\n\t\t\t${WHITE}🕵 MENCARI KERENTANAN SQL INJECTION${WHITE}${BOLD}"🕵
    print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}" 
    print_status "Sabar ya bos, Bagian ini emang agak lama.. ദ്ദി(˵ •̀ ᴗ - ˵ ) ✧" "${GREEN}"
    if command -v subfinder &> /dev/null && command -v gau &> /dev/null && command -v urldedupe &> /dev/null && command -v sqlmap &> /dev/null; then
        result=$(subfinder -d "$domain" -all -silent | gau | urldedupe | gf sqli | tee sql.txt; sqlmap -m sql.txt --batch --dbs --risk 2 --level 5 --random-agent )
        echo -e "${WHITE}${result}${NORMAL}${WHITE}" 
      count=$(echo "$result" | wc -l)
        print_status "⊱ ─────────────────────────────────── {.⋅ ✯ ⋅.} ─────────────────────────────────── ⊰" "${YELLOW}"
        print_status "\n( ＾◡＾)っ✂ DONE BOSKUU ૮₍´˶• . • ⑅ ₎ა " "${RED}${BOLD}" | lolcat
        if [[ -n "$output_file" ]]; then
            save_result "$result" "$output_file"
        fi
    else
        print_status "Tools Waybackurls,GF,Uro,qsreplace,freq lu ga ditemuin dalam path bro, coba install yang bener <(ꐦㅍ _ㅍ)>" "${RED}"
    fi
}

# Main script logic
if [[ $# -eq 0 ]]; then
    echo -e "${BOLD}${RED}Error: No arguments provided.${NORMAL}" | lolcat
    echo "Jalankan Perintah -h"
    exit 1
fi


function main() {
      # Mendapatkan direktori skrip ini
    SCRIPT_DIR=$(dirname "$(realpath "$0")")

    # Path absolut ke template
    TOOLS_PATH="$SCRIPT_DIR/Alat/SecretFinder/SecretFinder.py"
    TEMPLATE_PATH="$SCRIPT_DIR/Nuclei-Templates"
    echo -e "${RED}${banner}${NORMAL}"
    echo -e "${text}"

    output_file=""
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -sub) shift; domain="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_subfinder "$domain" "$output_file" ;;
            -subs) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_subfinder_list "$input_file" "$output_file" ;;
            -httpx) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_httpx "$input_file" "$output_file" ;;
            -info) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_info "$input_file" "$output_file" ;;
            -wayback) shift; domain="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_waybackurls "$domain" "$output_file" ;;
            -waybacks) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_waybacks "$input_file" "$output_file" ;;
            -isub) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_isub "$input_file" "$output_file" ;;
            -cors) shift; input_file="$1"; check_cors_misconfig "$input_file" ;;
            -nuclei) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_nuclei "$input_file" "$output_file" ;;
            -dir) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_dir "$input_file" "$output_file" ;;
            -mdir) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_mdir "$input_file" "$output_file" ;;
            -xss) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_xss "$input_file" "$output_file" ;;
            -mxss) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_mxss "$input_file" "$output_file" ;;
            -or) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_or "$input_file" "$output_file" ;;
            -sql) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_sql "$input_file" "$output_file" ;;
            -msql) shift; input_file="$1"; shift; [[ "$1" == "-sv" ]] && shift && output_file="$1"; run_msql "$input_file" "$output_file" ;;

            -js) run_js ;;
            -h|--help)
                echo "Usage: $0 [options]" | lolcat 
                echo ""
                echo "  -sv <file.txt>             Menyimpan output file" | lolcat
                echo ""
                echo "OSINT:"
                echo "  -sub <domain.com>          Untuk mencari subdomain" | lolcat
                echo "  -subs <file.txt>           Gunakan ini untuk mencari subdomain dalam list file" | lolcat
                echo "  -isub <subdomain.txt>      Untuk mengekstrak subdomain penting seperti admin,dev,api, DLL" | lolcat
                echo "  -httpx <sub.txt>           Untuk mencari subdomain yang aktif" | lolcat
                echo "  -info <sub.txt>            Untuk mencari informasi website" | lolcat
                echo "  -wayback <domain.com>      Untuk mencari url di 1 domain" | lolcat
                echo "  -waybacks <sub.txt>        Gunakan ini untuk mencari url pada list file" | lolcat
                echo "  -dir <sub.txt>             Untuk mencari Directory sensitif" | lolcat
                echo "  -mdir <sub.txt>            Gunakan ini ntuk mencari Directory sensitif pada list file" | lolcat
                echo ""
                echo "VULN:" | lolcat
                echo "  -nuclei <sub.txt>          Mencari Kerentanan pada semua Subdomain" | lolcat
                echo "  -cors <sub.txt>            Mencari Kerentanan CORS Misconfiguration" | lolcat
                echo "  -js <urls.txt>             Mencari Token tersembunyi di url file" | lolcat
                echo "  -xss <domain.com>          Mencari Kerentanan XSS" | lolcat
                echo "  -mxss <sub.txt>            Gunakan ini untuk mencari kerentanan xss pada list subdomain file" | lolcat
                echo "  -or <domain/file>          Mencari kerentanan Open Redirect" | lolcat
                echo "  -sql <domain.com>          Mencari kerentanan SQL INJETION" | lolcat
                echo "  -msql <sub.txt>            Gunakan ini untuk mencari kerentanan SQLI pada list file" | lolcat

                exit 0 ;;
            *) echo "Minum Dulu bro, lu typo <(ꐦㅍ _ㅍ)>, gaada perintah: $1" ;;
            
            
        esac
        shift
    done
}

main "$@"
