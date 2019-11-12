# Desktop icons

`.desktop` are usually just clickable shortcuts to start applications. They can, however, also contain 'actions' which start part of the program, or start the program in a certain state. Which makes them fun and hackable for users.





## Example .desktop files to show the syntax

    /usr/share/applications



### .desktop file : icon locations

Freedesktop specs are:

1. `~/.icons`

2.  `$XDG_DATA_DIRS`+`/icons`

3.  `/usr/share/pixmaps`

Icon format has to be:

- png, xpm or svg

- extension has to be (lowercase) .png, .xpm or .svg

- svg is optional and might be ignored

- image files may have extra icon-data in <imagename>.icon



### firefox.desktop : Add profile switching

Pin your firefox desktop link somewhere, rightclick it and find it's location. Then edit the `firefox.desktop` file

Right where it says `Actions=new-window;new-private-window`, add `profile-switch` to the actions, so it says `Actions=new-window;new-private-window;profile-switch`

Then, at the bottom of the file, add the following:

    
    [Desktop Action profile-switch]
    Name=Choose your profile
    Exec=firefox -ProfileManager

And save the file.

Now, if you rightclick firefox you should be able to see the default "new window" and "new private window" options, but also a "Choose your profile" option.

Voila.




