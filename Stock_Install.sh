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

# Verificando versão Java, se não existe instale-o
echo "Verificando versão java..."
sleep 3

if java -version &>/dev/null; then

                printf "Java já foi instalado!\n\n"
        else
                echo "Java necessário!"
                printf "Deseja instalar o java 17? [s/n]\n"

                read get

        if [ \"$get\" == \"s\" ];

                then
			printf "Instalando java..."
			sleep 2
                        sudo apt install openjdk-17-jre -y -s
			printf "Java instalado!\n"
        fi
fi

# Verificando versão do Docker, se não existe instale-o
echo "Verificando Docker..."
sleep 3

if command -v docker &>/dev/null; then
  echo "Docker está instalado"
else
  echo "Docker não está instalado"
  sudo apt install docker.io
fi
