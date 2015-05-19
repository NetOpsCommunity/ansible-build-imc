#! /bin/sh

CURRENT_DIR=/vagrant/install/linux/install
JAVA_HOME=$CURRENT_DIR/common/jre_linux
JAVA_CLASSPATH=$CURRENT_DIR/common/deploy.jar
MAIN_CLASS=com.h3c.imc.deploy.InstallSilence

if [ "`uname -i`" == "x86_64" ]; then
    JAVA_HOME=$CURRENT_DIR/common/jre_linux64
fi

chmod 755 "$JAVA_HOME"/bin/*

RHVER=`uname -r | awk '{print substr($0, match($0, "el"), 3)}'`
if [ "$RHVER" == "el6" ] && [ -f $JAVA_HOME/lib/fontconfig.RedHat.6.0.bfc ]; then
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.bfc $JAVA_HOME/lib/fontconfig.RedHat.bfc.bak
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.properties.src $JAVA_HOME/lib/fontconfig.RedHat.properties.src.bak
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.6.0.bfc $JAVA_HOME/lib/fontconfig.RedHat.bfc
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.6.0.properties.src $JAVA_HOME/lib/fontconfig.RedHat.properties.src
fi
if [ "$RHVER" == "el6" ] && [ -f $JAVA_HOME/lib/fontconfig.RedHat.6.bfc ]; then
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.bfc $JAVA_HOME/lib/fontconfig.RedHat.bfc.bak
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.properties.src $JAVA_HOME/lib/fontconfig.RedHat.properties.src.bak
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.6.bfc $JAVA_HOME/lib/fontconfig.RedHat.bfc
    mv -f $JAVA_HOME/lib/fontconfig.RedHat.6.properties.src $JAVA_HOME/lib/fontconfig.RedHat.properties.src
fi

if [ -z "$INSTALL_LANG" ] ; then
  INSTALL_LANG=en_US
fi

#echo Loading install wizard ...

#"$JAVA_HOME/bin/java" -Xmx256m -splash:"$CURRENT_DIR/common/splash.jpg" -Dinstaller.dir="$CURRENT_DIR" -DsupportedLocales="zh_CN;en_US" -Dedition=STANDARD -cp "$JAVA_CLASSPATH" "$MAIN_CLASS"
# Set up Xvfb so that progress scrollbars get sent to "virtual" X11 server
/usr/bin/Xvfb >/dev/null 2>&1 &
export DISPLAY=:0

"$JAVA_HOME/bin/java" -Xmx256m -Dinstaller.dir="$CURRENT_DIR" -DsupportedLocales="$INSTALL_LANG" -Dedition=STANDARD -Dcompany.flag=HP -D3CProductNumber=JG747AAE -DskipVmCheck=true -cp "$JAVA_CLASSPATH" "$MAIN_CLASS" -y
