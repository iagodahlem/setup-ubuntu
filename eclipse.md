# Eclipse Installation

1. Download eclipse.tar.gz in Eclipse site.

2. Unpack tar on /opt directory

    $ -> sudo tar -zxvf eclipse.tar.gz -C /opt/
    
3. Rename eclipse directory if the name is not 'eclipse'

    $ -> sudo mv /opt/eclipse*/ /opt/eclipse
    
4. Do an execute on 
    $ -> sudo gedit /usr/share/applications/eclipse.desktop
    
5. Paste this

[Desktop Entry]
Name=Eclipse 4
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse

## To Remove Eclipse from System

1. $ -> sudo rm -Rf /opt/eclipse/

2. $ -> sudo rm -Rf /usr/share/applications/eclipse.desktop