
# Declare installation constants
# You may want to change them!

# Source folder with the files to install
SOURCE=$(shell pwd)

# Destination folder to install to
DEST=~/".steam/steam/steamapps/workshop/content/32470/3131109252/"

# Shortcut for the Data/XML folder to clean
RM=$(DEST)Data/XML

all: clean update install

var:
	# These are your currently used system variables
	# Source folder with the files to install
	@echo $(SOURCE)
	# Destination folder to install to
	@echo $(DEST)
	# Shortcut for the Data/XML folder to clean
	@echo $(RM)

clean:
	# Remove outdated files
	@rm -f $(RM)/Units*.xml $(RM)/Units*.XML $(RM)/Hardpoints*.xml $(RM)/Specialstructures*.xml $(RM)/Starbases*.xml $(RM)/GroundBuildables*.xml $(RM)/Gameobjectfiles.xml $(RM)/DataMiner.exe
	@rm -r -f $(RM)/Cis/ $(RM)/Misc/ $(RM)/Rep/

update:
	# Update this project from git
	@git pull -ff

install:
	# Installing modified xml files
	@cp --recursive $(SOURCE)/Data $(DEST)

reinstall: clean install
