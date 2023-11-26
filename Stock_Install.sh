#!/bin/bash

cat << "EOF"

+===============================================================================+
|	,---.     ,---.         ,---.          o     |              |    	|
|	`---.,---.|__. ,---.    |---|,---.,---..,---.|--- ,---.,---.|--- 	|
|	    |,---||    |---'    |   |`---.`---.|`---.|    ,---||   ||    	|
|	`---'`---^`    `---'    `   '`---'`---'``---'`---'`---^`   '`---'	|
+===============================================================================+

EOF
# Instruções sobre o script
printf "Bem-vindo(a) ao assistente de instalação da Stocksafe\n"
printf "Para executar nossa aplicação precisamos verificar:\n"
printf "+ Java 17;\n+ Docker;\n+ Conteiner com MySql 8.0;\n+ Aplicação '.jar' monitora de recursos Stocksafe.\n\n"
printf "Aperte qualquer tecla para continuar...\n"
read

printf "Ao executar esse instalador você deve concordar em aceitar \na instalação de todos os requisitos do sistema Stocksafe.\n"
printf "Você está de acordo com isso? [s/n]\n"

read get

if [ \"$get\" == \"s\" ]; then

	printf "Executando assistente...\n\n"
	sleep 2
else
	printf "Saindo do programa...\n\n"
	sleep 1
	exit
fi

# Atualizando do sistema
echo "Atualizando sistema..."
sudo apt-get update -s && sudo apt-get upgrade -s
sleep 3

# Verificando versão Java
echo "Verificando versão java..."
sleep 3

if java -version &>/dev/null; then

	printf "Java 17 está instalado!\n\n"
else
        printf "Java 17 necessário!\n"
	printf "Iniciando instalação...\n"
	sleep 2
        sudo apt install openjdk-17-jre -y -s
	printf "Java instalado com sucesso!\n\n"
fi


# Verificando versão do Docker
echo "Verificando Docker..."
sleep 3

if command -v docker &>/dev/null; then

	printf "Docker está instalado!"
else
	printf "Docker necessário!\n"
	printf "Iniciando instalação...\n"
	sleep 2
	sudo apt install docker.io -y -s
	printf "Docker instalado com sucesso!\n\n"
fi

# Verificando contêiner
echo "Verificando contêiner com MySql 8.0..."



