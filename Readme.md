#Changes Made On 13th June 2017

###web.config
	- Added (ISOCARate_1.0.0.2) & Modified (ISOCARate_1.0.0.1) CA rate event names in web config
###ISO_Products/GetRate.aspx
	- Extended the update panel (UpdatePanel5) to cover ErrorMessage Literal as well in ISO_Products/GetRate.aspx 
###ISO_Products/GetRate.aspx..cs
	- invoked resetResponse() method on TestNow Button click
	- Inside getRateResponse() method added logic for CA to pick event name based on selected state
	- Inside ConstructRequestJson() method added logic for CA to modify event name based on state selected

#Changes made on 14th June 2017

###Login.aspx.cs
	- modified the login logic
###Login.aspx
	- Modified UI
###Web.config
	- Merged users in a single key
	- Increased session timeout from 20 mins to 60 mins

#Changes made on 23rd June 2017

	- Modified the vehicle import process and logic (csv to xls)
	- Added Logger.cs to log user activity
	- Added Analytics.cs to integrate google analytics
