#!/bin/bash

kansio1="compare1"
kansio2="compare2"
logfile="compare_log.txt"

# Hae aikaleimat molemmista kansioista
aikaleima1=$(find "$kansio1" -type f -exec stat --format='%Y' {} + | sort -n | tail -1)
aikaleima2=$(find "$kansio2" -type f -exec stat --format='%Y' {} + | sort -n | tail -1)

# Lisää erotin lokitiedostoon ja tulostukseen
separator="========================================"
echo "$separator" | tee -a "$logfile"
echo "$(date): Uusi vertailu alkaa (Unix-aikaleima: $(date +%s))" | tee -a "$logfile"
echo "" | tee -a "$logfile"

# Hae aikaleimat molemmista kansioista
aikaleima1=$(find "$kansio1" -type f -exec stat --format='%Y' {} + | sort -n | tail -1)
aikaleima2=$(find "$kansio2" -type f -exec stat --format='%Y' {} + | sort -n | tail -1)

# Tulostetaan tarkat aikaleimat molemmista kansioista ja kirjoitetaan lokitiedostoon
echo "$(date): Aikaleimat kansiossa $kansio1 (Unix-aikaleima: $aikaleima1):" | tee -a "$logfile"
find "$kansio1" -exec stat --format='%n %y (Unix-aikaleima: %Y)' {} \; | tee -a "$logfile"
echo "" | tee -a "$logfile"

echo "$(date): Aikaleimat kansiossa $kansio2 (Unix-aikaleima: $aikaleima2):" | tee -a "$logfile"
find "$kansio2" -exec stat --format='%n %y (Unix-aikaleima: %Y)' {} \; | tee -a "$logfile"
echo "" | tee -a "$logfile"

# Vertaa aikaleimoja ja kirjoita tulos lokitiedostoon ja tulostukseen
result=false
if [ "$aikaleima1" -gt "$aikaleima2" ]; then
  echo "$(date): Kansio1 on uudempi (Unix-aikaleima: $aikaleima1)" | tee -a "$logfile"
  echo "==== Uudempi aikaleima: $aikaleima1 ====" | tee -a "$logfile"
elif [ "$aikaleima1" -lt "$aikaleima2" ]; then
  echo "$(date): Kansio2 on uudempi (Unix-aikaleima: $aikaleima2)" | tee -a "$logfile"
  echo "==== Uudempi aikaleima: $aikaleima2 ====" | tee -a "$logfile"
  result=true
else
  echo "$(date): Kansiot ovat identtiset (Unix-aikaleimat: $aikaleima1 ja $aikaleima2)" | tee -a "$logfile"
fi
echo "" | tee -a "$logfile"

# Lisää erotin lokitiedostoon ja tulostukseen
echo "$(date): Vertailu päättyi (Unix-aikaleima: $(date +%s))." | tee -a "$logfile"
echo "$separator" | tee -a "$logfile"

# Tulosta lopputulos
echo "Vertailun tulos: $result"



