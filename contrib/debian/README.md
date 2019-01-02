
Debian
====================
This directory contains files used to package ravendarkd/ravendark-qt
for Debian-based Linux systems. If you compile ravendarkd/ravendark-qt yourself, there are some useful files here.

## ravendark: URI support ##


ravendark-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ravendark-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ravendark-qt binary to `/usr/bin`
and the `../../share/pixmaps/ravendark128.png` to `/usr/share/pixmaps`

ravendark-qt.protocol (KDE)

