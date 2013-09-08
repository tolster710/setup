IFS='
'
for f in `find . -name "*] - *"`;
do t=`echo $f | awk '/ - / {print $5}'`; 
mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/rename.log;
done

for f in `find . -name "*HDTV*"`;
do t=`echo $f | sed 's/HDTV.//g' | sed 's/x264//g' | sed 's/720p//g' | sed 's/EVOLVE//g' sed 's/ASAP//g' | sed 's/.-//g' `;
echo "$t";
done


mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/shorten.log;
done



#run before it

find . -name "*.rar" -exec unrar e {} \;
find . -name "*.rar" -exec rm {} \;
find . -name "*.r0*" -exec rm {} \;
find . -name "*.r2*" -exec rm {} \;
find . -name "*.r1*" -exec rm {} \;
find . -name "*.txt" -exec rm {} \;
find . -name "*.nfo" -exec rm {} \;
find . -name "*.sfv" -exec rm {} \;
find . -name "*.jpg" -exec rm {} \;
find . -name "*.mkv" -exec mv {} .\;
find . -name "*.mp4" -exec mv {} .\;
find . -name "*.avi" -exec mv {} .\;
find . -name "*.m4v" -exec mv {} .\;
find . -name "*sample.*" -exec rm {} \;
find . -name "Sample/*" -exec rm {} \;
find . -type d -name "Sample" -exec rmdir {} \;
find . -type d -exec rmdir {} \;





