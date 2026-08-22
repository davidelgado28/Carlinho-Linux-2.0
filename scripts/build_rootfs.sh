#!/bin/bash
set -e

echo "=== Preparando o RootFS ==="
ROOTFS_DIR="build/rootfs"

# Cria diretórios essenciais do sistema de arquivos Linux
mkdir -p $ROOTFS_DIR/{dev,proc,sys,etc,usr/share/backgrounds,bin,sbin,lib,lib64,mnt,root,tmp}

# Copia as configurações do repositório para o RootFS
cp -r rootfs/* $ROOTFS_DIR/

# Copia o papel de parede
cp assets/wallpaper.jpg $ROOTFS_DIR/usr/share/backgrounds/wallpaper.jpg

# Aplica permissões de execução nos scripts
chmod +x $ROOTFS_DIR/etc/init.d/*
chmod +x $ROOTFS_DIR/etc/udhcpc/default.script
chmod +x $ROOTFS_DIR/etc/labwc/autostart

echo "RootFS montado com sucesso!"
