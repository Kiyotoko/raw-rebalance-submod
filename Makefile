
# Declare installation constants
# You may want to change them!

# Source folder with the files to install
SOURCE=$(shell pwd)

# Destination folder to install to
DEST=~/".steam/steam/steamapps/workshop/content/32470/3131109252/"

all: help

clean:	## Clean build folder
	# Clean build folder
	@rm -fr $(TARGET)

help:	## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

update:	## Update this mod from git
	# Update this project from git
	@git pull -ff

install: ## Install this mod to steam
	# Installing modified xml files
	@cp --recursive $(SOURCE)/src/* $(DEST)
