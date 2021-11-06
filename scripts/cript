gpg --encrypt-files -a -r mateus.cabete@gmail.com ~/journal/*.txt
mv *.asc ~/backup/journal
mv *.txt ~/archive
rsync -avPh -e ssh ~/backup mp@mpcabete.xyz:/home/mp

