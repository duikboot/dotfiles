WHOAMI=`whoami`
echo $WHOAMI

if pgrep -f -u $WHOAMI mate-volume-control-applet;
then
    echo alive &> /dev/null
else
    mate-volume-control-applet&
fi

if pgrep -u $WHOAMI nm-applet;
then
    echo alive &> /dev/null
else
    nm-applet&
fi

if pgrep -u $WHOAMI feh;
then
    echo alive &> /dev/null
else
    feh --bg-fill ~/wallpapers/23616853.jpg
fi

if pgrep -u $WHOAMI xscreensaver;
then
    echo alive &> /dev/null
else
    xscreensaver&
fi

if pgrep -f -u $WHOAMI hp-systray;
then
    echo alive &> /dev/null
else
    hp-systray&
fi

if pgrep -u $WHOAMI trayer;
then
    echo alive &> /dev/null
else
    trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 12&
    # stalonetray
fi

