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
echo "Bem-vindo(a) ao assistente de instalação da Stocksafe"
echo "Para executar nossa aplicação vamos verificar:"
printf "+ Java;\n+ Docker;\n+ Conteiner com MySql 8.0;\n+ Aplicação monitora de recusrsos Stocksafe.\n\n"
echo "Aperte qualquer tecla para continuar..."
read

# Atualizando do sistema
echo "Atualizando sistema..."
sudo apt-get update && sudo apt-get upgrade
printf "\n"

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
