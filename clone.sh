#!/bin/sh

TARGET_DIR="/app"
REPO_FRONT="my-ferme-front"
REPO_BACK="my-ferme"
GITHUB_ACCOUNT="bill1ben"

update_or_clone_repo() {
    REPO_URL=$1
    DEST_DIR=$2

    if [ -d "$DEST_DIR/.git" ]; then
        echo "Mise à jour du dépôt $DEST_DIR"
        git -C "$DEST_DIR" pull
    else
        echo "Clonage du dépôt $REPO_URL vers $DEST_DIR"
        git clone "$REPO_URL" "$DEST_DIR"
    fi
}

# Cloner ou mettre à jour les deux dépôts
update_or_clone_repo "https://github.com/$GITHUB_ACCOUNT/$REPO_FRONT.git" "$TARGET_DIR/$REPO_FRONT"
update_or_clone_repo "https://github.com/$GITHUB_ACCOUNT/$REPO_BACK.git" "$TARGET_DIR/$REPO_BACK"

echo "Opération git terminée."
