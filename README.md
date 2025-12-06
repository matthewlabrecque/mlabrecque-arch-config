# Fedora Atomic Autoconfig Setup
A auto-configuration utility used to create an opinionated system designed for development applications, built off Fedora Atomic

## Installation
To run the utility, do the following
```sh
git clone https://codeberg.org/mhlab/autoconfig.git ~/Downloads/FedoraAtomicAutoconfig
cd ~/Downloads/FedoraAtomicAutoconfig
./auto-config.sh
```
## Notes
This autoconfig script is designed for Fedora Atomic systems. Fedora Atomic is variant of Fedora that uses an immutable root filesystem (read-only) and manages applications primarily via containerization technologies like Docker or Podman, and atomic updates for enhanced stability and security.

I prioritize stability above all else in my systems, meaning all development on my system is done through Toolbox containers, if I blow something up in a container, I can just wipe the container without losing any important features/files.

## Who is this script best for?
If you are someone who primarily does software engineering and wants a system just for that, this setup will be your best friend. This script isn't designed for you Arch weirdos, it's designed to just get something working.