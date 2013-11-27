
#Updated 26Nov13
#Git script to cleanup trenort directory
#To do - end--> run move script to put folders to directory under TV shows --> log it and deliver to email
#To do remove more file junk
#To do --> transcode
trenort=/home/tolly/Drobo/Trenort/trenort
AGIT_DIR=$(pwd);
cd $trenort
IFS='
'

#do below loop to strip out the [] from the names and the first part


#run First to remove unneeded files and consolidate directories.

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

#Finds and removes all show names that begin with []
for f in `find . -name "* - *"`;
do t=`echo $f | awk '/ - / {print $NF}'`; 
mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/rename.log;
done

#strips suffix of filename
rootDir=$(pwd);
for f in `find $rootDir -name "*[Hh][Dd][Tt][Vv]*" -o -name "*mp4" -o -name "*avi" -o -name "*mkv"`;
do t=`echo $f | 
sed 's/[Hh][Dd][tT][Vv].//g' | 
sed 's/[hHxX]264//g' |
 sed 's/720[iIPp]//g' | 
sed 's/1080[ipIP]//g' |
sed 's/BluRay//g' |
sed 's/YIFY//g' |
sed 's/ftp//g' |
sed 's/WEBDL//g' |
sed 's/EVOLVE//g' | 
sed 's/ASAP//g' | 
sed 's/IMMERSE//g' |
 sed 's/[lL][oO][lL]//g' | 
sed 's/KILLERS//g' |
 sed 's/REPACK//g' |
 sed 's/DIMENSION//g' | 
  sed 's/[wW][eE][bB][dD][lL]//g' | 
  sed 's/[wW][eE][Bb][Rr][iI][Pp]//g' | 
  sed 's/[bB][Aa][jJ][sS][kK][oO][rR][vV]//g' |
sed 's/A[FA][GC]//g' | 
sed 's/MVGroup//g' | 
sed 's/[Dd][oO][Ll][eE][Mm][iI][tT][eE]//g' |
sed 's/[Cc][rR][iI][mM][Ss][oO][nN]//g' |
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
sed 's/264//g' |
sed 's/[0-9].[0-9]//g'
sed 's/\-//g'  |
sed 's/\.\./\./g' |
sed 's/\.\./\./g' |
sed 's/\.\./\./g'
`;
mv $f $t && echo "moved $f -> $t" >> /home/tolly/Drobo/Trenort/shorten.log;
done


#Moves the files to the proper directory under TVShows

#Producton 11/26
testnames=('Parks' 'Peele' 'Interest' 'Newsroom' 'American' 'Family' 'Community' 'Broke' 'Portlandia' 'Archer' 'QI' 'Planet' 'Californ' 'Suits' 'Psych' 'Mother' 'Comic' 'Horizon' ' Tosh' 'Storage' 'Walking')
rootDir=$(pwd)
MovieDir=/home/tolly/Drobo/TV\ Shows
for ((i=0; i<${#testnames[@]};i++)); 
do  
for f in `find $rootDir -name "*${testnames[$i]}*"`;
do 
#echo "$i, $f";
base_dir=$(find $MovieDir -maxdepth 1 -type d -name "*${testnames[$i]}*");
if [ "$base_dir" = "" ]; then
echo "Cannot find destination for $f"
else
season=$(echo $f | sed 's/[-_.]/ /g' | grep -oh "\w*[sS][0-9]\w*" | sed 's/[eE]/ /g' | sed 's/[sS]/Season/g' | sed 's/0//g' | awk '{print $1}');
move_dir=$base_dir/$season;
if [ -d $move_dir ]; 
then
echo "Dir exists"
else
mkdir $move_dir;
fi
mv $f $move_dir/ && echo "Moved $f --> $movedir" >> /tmp/Trenort_moved.txt
fi
done; 
done


#launches the python script from its location under /home/tolly/Documents/apt_scripts

python /home/tolly/Documents/apt_scripts 'johnftolly@gmail.com' 'AASDFASDF' '/home/tolly/Documents/apt_scripts'







