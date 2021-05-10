help:		##Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

catalogue:		##Install catalogue component for Roboshop Project
	@echo installing catalogue
	@sh components/catalogue.sh
cart:		##Install cart component for Roboshop Project
	@echo installing cart
	@sh components/cart.sh
