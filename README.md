# Convert SVGs to ICO-Files for ISO-Images
This is a simple bash script for creating an ICO-File file.

It is supposed to be run in one directory with a source SVG-File and an ISO-Image, to which the new icon will be added if available.

If no ISO-Image is available this script will still create:
- a hidden directory called .data (containing the ICO-Files)
- a file called autorun.inf

## Setup

1. Run ``chmod +x mkico.sh; chmod +x mkico-setup.sh`` to make sure the scripts can be executed.
2. Run ``./mkico-setup.sh`` to make sure you have the dependencies for mkico.sh
<br>**Note: The setup-script was created for Ubuntu based Linux systems like Mint.**

## Run Script
1. Make sure the script is in one directory with only the SVG and ISO file.
2. Run ``./mkico.sh input.svg input.iso`` and enter a name for the new file.
   (``./mkico.sh input.svg`` would just create the files you may move into and ISO-Image yourself)
3. Clean up what you don't need and done.
