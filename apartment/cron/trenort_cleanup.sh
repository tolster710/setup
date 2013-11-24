
#Updated 12Sept13
#Git script to cleanup trenort directory
#To do - end--> run move script to put folders to directory under TV shows --> log it and deliver to email
#To do remove more file junk
#To do --> transcode

IFS='
'

#do below loop to strip out the [] from the names and the first part

for f in `find . -name "* - *"`;
do t=`echo $f | awk '/ - / {print $NF}'`; 
mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/rename.log;
done

for f in `find . -name "*[Hh][Dd][Tt][Vv]*" -o -name "*mp4" -o -name "*avi" -o -name "*mkv"`;
do t=`echo $f | 
sed 's/HDTV.//g' | 
sed 's/x264//g' |
 sed 's/720p//g' | 
sed 's/1080p//g' |
sed 's/BluRay//g' |
sed 's/YIFY//g' |
sed 's/ftp//g' |
sed 's/WEBDL//g' |
sed 's/EVOLVE//g' | 
sed 's/ASAP//g' | 
sed 's/IMMERSE//g' |
 sed 's/LOL//g' | 
sed 's/KILLERS//g' |
 sed 's/REPACK//g' |
 sed 's/X26DIMENSION//g' | 
sed 's/AAC//g' | 
sed 's/MVGroup//g' | 
sed 's/\[VTV\]//g' |
sed 's/\[ettv\]//g' |
sed 's/XviDAFG//g' |
 sed 's/DHD//g' |  
sed 's/killers//g' |
sed 's/480p//g' | 
sed 's/hdtv//g' |
sed 's/2hd//g' |
sed 's/xvidfqm//g' |
sed 's/x264//g' |
sed 's/\-//g'  |
sed 's/\.\./\./g' |
sed 's/\.\./\./g' |
sed 's/\.\./\./g'
`;

mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/shorten.log;
done



#trying to unify script - will only work for items with the brackets in the name
for f in `find . -name "*] - *"`;
do t=`echo $f | awk '/ - / {print $NF}'`; 
for u in $t; 
do s=`echo $u | 
sed 's/[Hh][Dd][tT][Vv].//g' | 
sed 's/[x]264//g' |
 sed 's/720p//g' | 
sed 's/1080p//g' |
sed 's/BluRay//g' |
sed 's/YIFY//g' |
sed 's/ftp//g' |
sed 's/WEBDL//g' |
sed 's/EVOLVE//g' | 
sed 's/ASAP//g' | 
sed 's/IMMERSE//g' |
 sed 's/LOL//g' | 
sed 's/KILLERS//g' |
 sed 's/REPACK//g' |
 sed 's/DIMENSION//g' | 
  sed 's/WEBDL//g' | 
  sed 's/BAJSKORV//g' |
sed 's/A[FA][GC]//g' | 
sed 's/MVGroup//g' | 
sed 's/\[VTV\]//g' |
sed 's/\[ettv\]//g' |
sed 's/[xX]viDAFG//g' |
 sed 's/DHD//g' |  
 sed 's/[Ff][oO][vV]//g' |
sed 's/killers//g' |
sed 's/480p//g' | 
sed 's/[Xx][Vv][Ii][dD]//g' |
sed 's/[m2][hsH][Dd]//g' |
sed 's/xvidfqm//g' |
sed 's/[Xx]264//g' |
sed 's/\-//g'  |
sed 's/\.\./\./g' |
sed 's/\.\./\./g' |
sed 's/\.\./\./g'
`;
echo $s; done
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
find . -name "*.jpeg" -exec rm {} \;
find . -name "*.png" -exec rm {} \;
find . -name "*.srt" -exec rm {} \;
find . -name "*.mkv" -exec mv {} . \;
find . -name "*.mp4" -exec mv {} . \;
find . -name "*.avi" -exec mv {} . \;
find . -name "*.m4v" -exec mv {} . \;
find . -name "*[Ss]ample*" -exec rm {} \;
find . -name "Sample/*" -exec rm {} \;
find . -name "sample-*" -exec rm {} \;
find . -type d -name "Sample" -exec rmdir {} \;
find . -type d -exec rmdir {} \;



#Spits out what season is associated with the episode / info - includes all permutations on 
for f in `find . -name "*[Ss][0-9]*"`; 
do
echo $f | sed 's/[-_.]/ /g' | grep -oh "\w*[sS][0-9]\w*" | sed 's/[eE]/ /g' | sed 's/[sS]/Season/g' | sed 's/0//g' | awk '{print $1}'; 
done



#scripting - gets file and puts it under season heading
#NEXT - Add outer loop for each directory in TV Shows
rootDir=$(pwd)
for f in `find . -name "*[Ss][0-9]*"`; 
do
dir=$(echo $f | sed 's/[-_.]/ /g' | grep -oh "\w*[sS][0-9]\w*" | sed 's/[eE]/ /g' | sed 's/[sS]/Season/g' | sed 's/0//g' | awk '{print $1}'); 
movedir=$rootDir/$dir;
mkdir $movedir;
mv $f $movedir/;
done


#NEXT - Add outer loop for each directory in TV Shows - doesnt work right now
IFS='
'
rootDir=$(pwd);
for i in `find $rootDir -type d -maxdepth 1`;
	do
	TVDir=$i/;
	for f in `find $TVDir -name "*[Ss][0-9]*"`; 
		do
		dir=$(echo $f | sed 's/[-_.]/ /g' | grep -oh "\w*[sS][0-9]\w*" | sed 's/[eE]/ /g' | sed 's/[sS]/Season/g' | sed 's/0//g' | awk '{print $1}'); 
		movedir=$TVDir/$dir;
		if [ -d $movedir ]; then
			sleep 1;
		else
			mkdir $movedir;
		fi
		mv $f $movedir/;
	done
done
