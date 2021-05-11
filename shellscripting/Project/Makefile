help:		##Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
common:
	@sh components/common.sh
frontend:	common ##Install frontend component for Roboshop Project
	@echo installing frontend component
	@sh components/frontend.sh
mongodb:	common ##Install mongodb component for Roboshop Project
	@echo installing mongodb component
	@sh components/mongodb.sh
catalogue:	common ##Install catalogue component for Roboshop Project
	@echo installing catalogue
	@sh components/catalogue.sh
cart:		common ##Install cart component for Roboshop Project
	@echo installing cart
	@sh components/cart.sh
