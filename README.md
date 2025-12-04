The following script is used to auto-config a Fedora Atomic system for CS applications.

To run, simply run "./auto-config.sh"

NOTE: This script is designed ONLY for Fedora Atomic distributions (such as Silverblue, Kinoite, and Sway/Budgie Atomic). It will NOT work on any other distribution!

Because of the choice of an atomic Linux distribution, note that there are two separate processes occuring: all terminal tools are being installed via rpm-ostree packages, while all desktop tools are being installed via Flatpak. This choice might upset some Linux purists, but it's my damn autoconfig script for my damn setup so go pound tar.
