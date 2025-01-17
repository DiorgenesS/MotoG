#/bin/bash

PWD=`pwd`
TARGET_DIR=out/merged_target_files
GAPPS=$PWD/gapps

echo
echo ">>> Removing existing directory"
echo
rm -rf $TARGET_DIR/DATA
echo
echo ">>> Creating directories"
echo
mkdir $TARGET_DIR/DATA
mkdir $TARGET_DIR/DATA/system_data
mkdir $TARGET_DIR/DATA/system_data/app
mkdir $TARGET_DIR/DATA/system_data/priv-app
echo
echo ">>> Move some apps into data"
echo
mv $TARGET_DIR/SYSTEM/app/AppCenterIntl $TARGET_DIR/DATA/system_data/app
mv $TARGET_DIR/SYSTEM/priv-app/Browser $TARGET_DIR/DATA/system_data/priv-app
mv $TARGET_DIR/SYSTEM/priv-app/Email $TARGET_DIR/DATA/system_data/priv-app
mv $TARGET_DIR/SYSTEM/priv-app/Music $TARGET_DIR/DATA/system_data/priv-app
mv $TARGET_DIR/SYSTEM/priv-app/Video $TARGET_DIR/DATA/system_data/priv-app

#Added Gapps to ROM
if [ -e $GAPPS/SYSTEM ]
then
   echo ">>> Adding Gapps to ROM"
   cp -rf $GAPPS/SYSTEM $TARGET_DIR
   echo ">>> Gapps added"
fi

#Removed themes not used in the international version
echo ">>> Goodbye unnecessary files"
echo
rm -rf $TARGET_DIR/SYSTEM/customizecenter/theme/mtpks
