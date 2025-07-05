
# Declare installation constants
# You may want to change them!

# Source folder with the files to install
SOURCE=$(shell pwd)

# Destination folder to install to
DEST=~/".steam/steam/steamapps/workshop/content/32470/3131109252/"

DEPLOY=~/"Documents/Kiyotoko/eaw-modtools/WorkshopContent/RaWRebalanceSubmod/"

all: update install

update:
	# Update this project from git
	@git pull -ff

install:
	# Installing modified xml files
	@cp --recursive $(SOURCE)/Data $(DEST)

deploy:
	@cp --recursive $(DEST)/Data $(DEPLOY)
