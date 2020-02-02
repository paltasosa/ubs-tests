# ubs-tests
This test repository is used as an interview exercise for ubs.com through Luxoft.

# pre-requisites

*Ruby
*Cucumber
*Selenium-chromedriver


# installation
run `bundle install` inside `cucumber` folder to make sure all gems are updated before running the tests.

# usage
go to `cucumber`folder.

run `cucumber` to run the basic set of tests, with no variables specified.

run `cucumber COUNTRY=[usa/france]` to run the tests specified for that country. Since this is a basic exercise, only those 2 countries were specified, even there are many more.

run `cucumber USERNAME=username PASSWORD=password` to run the tests and verify login is successful for specified user/pass. This is currently being skipped since I don't have valid credentials at the moment.