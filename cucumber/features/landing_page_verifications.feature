Feature: Landing page is working correctly
	We want to check if the landing page is showing what's expected

	Scenario: Verify headers
		Given the user access ubs.com page
		When page is loaded
		Then domicile selection button is displayed
		And UBS login button is displayed
		And contact icon is displayed
		And wealth management link is displayed
		And asset management link is displayed
		And investment bank link is displayed
		And corporate and institutional client link is displayed
		And about us link is displayed
		And careers link is displayed

	Scenario: Verify login options based on selected country
		Given the user access ubs.com page
		When user selects country from domicile
		Then ubs logins options are displayed correctly for country

	Scenario: Verify USA login is working as expected
		Given the user access ubs.com page
		When user selects US client account login
		Then user is redirected to login page
		When user tries to login
		Then login is working for specified user and password

	Scenario: Verify USA registration is working as expected
		Given the user access ubs.com page
		When user selects US client account login
		Then user is redirected to login page
		And user can select register now to start a new registration process correctly