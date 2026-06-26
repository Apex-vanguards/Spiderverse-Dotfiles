#!/bin/bash

# Dosya adını bir değişkene atayalım ki tekrar tekrar date komutunu çağırmayalım
FILENAME="$HOME/Pictures/ss-$(date +%s).png"

if [ "$1" == "area" ]; then
  geometry=$(slurp)
  if [ -z "$geometry" ]; then
    exit 0
  fi
  wayshot -g "$geometry" "$FILENAME"
else
  wayshot "$FILENAME"
fi

# Ekran görüntüsünü panoya kopyala (resim formatında)
if [ -f "$FILENAME" ]; then
  wl-copy <"$FILENAME"
  notify-send "Screenshot Alındı" "Dosya kaydedildi ve panoya kopyalandı." -i "$FILENAME"
else
  notify-send "Hata" "Ekran görüntüsü alınamadı."
fi
