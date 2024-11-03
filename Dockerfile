# Choisir une image de base comme Ubuntu ou Alpine
FROM alpine:latest

# Installer Git
RUN apk add --no-cache git

WORKDIR /app

# Script de clonage
COPY clone.sh /usr/local/bin/clone.sh
RUN chmod +x /usr/local/bin/clone.sh

# Exécuter le script lors du démarrage
CMD ["/usr/local/bin/clone.sh"]
