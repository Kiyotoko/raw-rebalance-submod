
# Declare installation constants
# You may want to change them!
SOURCE=$(shell pwd)
TARGET=".steam/steam/steamapps/workshop/content/32470/3131109252/"
DEST=~/$(TARGET)
RM=$(DEST)Data/XML

all:
	@make clean
	@make update
	@make install

var:
	# These are your currently used system variables
	@echo $(SOURCE)
	@echo $(TARGET)
	@echo $(DEST)
	@echo $(RM)

clean:
	# Remove outdated files
	@rm -f $(RM)/Units*.xml $(RM)/Units*.XML $(RM)/Hardpoints*.xml $(RM)/Specialstructures*.xml $(RM)/Starbases*.xml $(RM)/GroundBuildables*.xml $(RM)/Gameobjectfiles.xml $(RM)/DataMiner.exe

update:
	# Update this project from git
	@git pull -ff

install:
	# Installing modified xml files
	@cp --recursive $(SOURCE)/Data $(DEST)

