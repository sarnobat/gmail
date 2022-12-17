cat output.sarnobat.hotmail.txt | perl -pe 's{::.*}{}g' | perl -pe 's{^.*?\s+}{}g' | perl -pe 's{.*<(.*)>.*}{$1}g'  | perl -pe 's{.*@}{@}g' | sort | uniq -c | sort -n
