#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Requer privilégios de root. Tente sudo."
  exit 1
fi

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
sudo apt-get update && sudo apt-get upgrade
sleep 3

# Verificando versão Java
echo "Verificando versão java..."
sleep 3

java_version=$(java -version | awk '{print $2}')

if [ "$java_version" == "17" ]; then
	printf "Java 17 está instalado!\n\n"
else
        printf "Java 17 necessário!\n"
	printf "Iniciando instalação...\n"
	sleep 2
        sudo apt install openjdk-17-jre -y -s
	printf "Java instalado com sucesso!\n\n"
	java -version
fi


# Verificando versão do Docker
echo "Verificando Docker..."
sleep 3

if command -v docker &>/dev/null; then

	printf "Docker está instalado!\n\n"
	sleep 1
else
	printf "Docker necessário!\n"
	printf "Iniciando instalação...\n"
	sleep 2
	sudo apt install docker.io -y -s
	printf "Docker instalado com sucesso!\n\n"
	docker -version
fi

sudo systemctl start docker
sudo systemctl enable docker


# Verificando imagens Docker
echo "Verificando imagem docker com MySql 8.0..."
sudo docker pull mysql:8.0
printf "Imagens Docker nessa máquina:"
sudo docker images

# Iniciando contêiner MySql 8.0
echo "Iniciando contêiner..."
sleep 3
sudo docker run -d -p 3306:3306 --name ContainerBD -e "MYSQL_DATABASE=StockSafe" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8.0
echo "Verificando contêiner..."
sleep 3
sudo docker ps -a

# Baixar o monitoramento java  (jar antigo)
echo "Baixando arquivo JAR..."
sleep 3
jar_url="https://github.com/StockSafe-Solutions/CLI-Java/releases/download/v1.1.0/CLI-Teste-1.0-SNAPSHOT.jar"
wget $jar_url
printf "Arquivo JAR baixado com sucesso!\n\n"

# Executar jar
sleep 3
java -jar CLI-Teste-1.0-SNAPSHOT.jar
printf "Instalação concluída com sucesso!\n\n"
