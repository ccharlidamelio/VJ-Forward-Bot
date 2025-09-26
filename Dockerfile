# Utiliser une image plus récente avec Debian bullseye ou bookworm
FROM python:3.10.8-slim-bullseye

# Mettre à jour et installer git
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copier requirements et installer les dépendances Python
COPY requirements.txt /requirements.txt
RUN pip3 install --upgrade pip && pip3 install --no-cache-dir -r /requirements.txt

# Préparer le répertoire de l'application
RUN mkdir /VJ-Forward-Bot
WORKDIR /VJ-Forward-Bot
COPY . /VJ-Forward-Bot

# Commande de démarrage
CMD ["python3", "main.py"]
