@HomePage
Feature: Home Page Testing


@REG_HOMEPAGE_T01
Scenario: Search flight with one way trip and round trip

Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "17 Sep 2017"
Then I verify default Single flight option in return date
And I verify Return on option unchecked
And I update "2" Adult "2" Children "1" Babies 
And I select option Show prices in Flying Blue Miles
And I click on Search button
Then I should see Book a Flight Page with flight options
When I click on Home Button
Then I verify the entered values are auto populated
When I select Return on option
And I should see arrival date auto populated same as Departure date
When I click search button
Then I should see Book a Flight Page with flight options

@REG_HOMEPAGE_TC02
Scenario: Check user not able to select past date in Departure date and Arrival Date

Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I should see Depart on date populated with today date
When I select Date icon in Departure date
Then I should see calendar pop-up with today date selected
When I try to select any past date
Then I should see dates not enabled to click
When I select Date icon in Arrival date
Then I should see calendar pop-up with today date selected
When I try to select any past date
Then I should see dates not enabled to click



@REG_HOMEPAGE_TC03
Scenario: Verify the search by selecting departure date is greater than arrival date

Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "25 Sep 2017"
When I check Return option
Then I should calendar to choose arrival date is getting appeared automatically 
And I select arrival date ae "20 Sep 2017"
And I update "2" Adult "2" Children "1" Babies 
And I select option Show prices in Flying Blue Miles
And I click on Search button
Then I should see error message to select arrival date is greater than then departure date

@REG_HOMEPAGE_TC04
Scenario: Verify that user can select dates only from current year and next year
	
Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
When I select Departure Date icon
Then I see calendar popup 
And I verify the displayed year as current year 
And I see option to move to next month
When I click on next button till it gets disappear
Then I should see the December of Upcoming year
When I select Arrival Date icon
Then I see calendar popup 
And I verify the displayed year as current year 
And I see option to move to next month
When I click on next button till it gets disappear
Then I should see the December of Upcoming year
And I should see option to select Single Flight


@REG_HOMEPAGE_TC05
Scenario: Verify Return option is getting de-selected when we select Single flight from Arrival date calendar popup
	
Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "25 Sep 2017"
When I check Return option
Then I should calendar to choose arrival date is getting appeared automatically 
When I select single flight from calendar
Then I should see Return option is getting de-selected
And I should see Single Flight Text on Arrival date

@REG_HOMEPAGE_TC06
Scenario: Verify the flight search with valid and invalid passenger counts
	
Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "25 Sep 2017"
When I check Return option
Then I should see calendar to choose arrival date is getting appeared automatically 
And I select arrival date as "20 Sep 2017"

When In tap on passenger input 
And I update values to zero for all type passengers
And click save button
Then I see zero passenger count in passenger input
And I click on Search button
Then I should see Book a Flight Page with flight options

	When I click on Home icon 
	Then I see home page with auto populated values
When In tap on passenger input 
And I update value for all type passengers in such a way that sum of all <25
And click save button
Then I should see sum of all type passenger count in passenger input
And I click on Search button
Then I should see Book a Flight Page with flight options


When I click on Home icon 
	Then I see home page with auto populated values

When In tap on passenger input 
And I update value for all type passengers in such a way that sum of all >25
Then I see warning message 
“””
Are you planning on traveling with more than 25 people? No problem! Please send us your request by filling in our group form.

“””
And click save button
Then I should see sum of all type passenger count in passenger input
And I click on Search button
Then I should see Book a Flight Page with flight options


@REG_HOMEPAGE_TC07
Scenario: Verify user able to enter values in subscribe and can we help you
	
Given I am on the Transavia homepage
When I scroll down to the end of the page
Then I can see enter email field to subscribe
When I enter invalid email address “dada.com”
And click subscribe button
Then I should see error message
“””
The email address consists of invalid characters. Please refill the email address with valid characters.
“””
When I enter valid email address “dada.gamil@com”
And click subscribe button
Then I should success message for subscription
“””
We sent you an e-mail to confirm the application to receive our newsletter.
“””

When I enter valid question in type your question text field 
And I click search button
Then I should see valid search result

@REG_HOMEPAGE_TC08
Scenario: Verify search results by selecting with price and without price 
Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "17 Sep 2017"
Then I verify default Single flight option in return date
And I verify Return on option unchecked
And I update "2" Adult "2" Children "1" Babies 
And I select option Show prices in Flying Blue Miles
And I click on Search button
Then I should see Book a Flight Page with flight options displayed with price

When I click on Home icon 
	Then I see home page with auto populated values
Then I unselect the option “Show prices in Flying Blue Miles”
And I click on Search button
Then I should see Book a Flight Page with flight options displayed without price


@REG_HOMEPAGE_TC09
Scenario: Verify user not able to select Origin and Destination if user enter invalid values
 
Given I am on the Transavia homepage
When I enter Departure station as "xxx"
Then I should see the message “No departure airports found”

When I enter Arrival station as "yyy"
Then I should see the message “No Destination found”	


@REG_HOMEPAGE_TC10
Scenario: Verify user not able to select Origin and Destination if user enter invalid values
 
Given I am on the Transavia homepage
When I enter Departure station as "Almeria, Spain"
When I tap on the destination field
Then I should see option to select destination same as origin
And I should see option to select from other airports


@REG_HOMEPAGE_TC11
Scenario: Verify the page appearance when we reduce the browser size

Given I am on the Transavia homepage
	Then I verify the all page elements displayed properly
	When I reduce the browser size to 75% of the original size
	And I verify the all page elements aligned properly
	When I reduce the browser size to 50% of the original size
	Then I should see links are getting collapsed in left corner 
	And I should see options are getting decreased in Home page
When I reduce the browser size to 25% of the original size
Then I should see page which is resembling mobile web site
And I should see home page with minimal options

@REG_HOMEPAGE_TC12
Scenario: Verify header and footer links and options in Home Page 
Given I am on the Transavia homepage
Then I verify the left header links
“””
Home Button logo
Plan and Book
Manage Your booking
Service
“””
And I verify the Right Header links
“””
Flight Status
Online Check in
Get Inspired!
Destinations
Login 
Create Account
“””
And I see options below to create account
“””
Contact 
Netherlands
EUR
“””
When I scroll down to the end of the page
Then I should see About Transavia with 9 sub options
And I should see Self Service with 6 sub options
And I should see Get Inspired with 6 sub options


@REG_HOMEPAGE_TC13
Scenario: Verify that 2 times option displayed for Manage your booking and Online check-in in Home page 
Given I am on the Transavia homepage
Then I can see Manage your booking in header link
And I see Online check-in in header link
When I scroll down till to see bottom of search panel
Then I should see one more option for Manage your booking 
And I should see “Go to My Transavia” 
And I should see one more option for Online check-in 
And I should see “I want to check in”


@REG_HOMEPAGE_TC14
Scenario: Verify the various options displayed in the Home page
Given I am on the Transavia homepage
Then I can see search panel 
And I see options in left of the panel
“””
Offer price with from title
Go on a trip in the late summer
“””
And I should see transavia logo in right of the panel
And I should see various fields to complete search
“””
From
To
Depart On date field 
Return On date field
Return On check box
Who will be Travelling
Show prices in flying Blue Miles check box
Search button
Advanced Search 
Add Multiple Destination
“””
When I scroll down to see Our top destinations
Then I see various destinations with offer price
And I see label Prices are one way under destination list
And I see View all our destinations with title 
“””
Want to fly affordably to more than 100 destinations in Europe? Book a flight with Transavia 
“””
And I see transavia logo with text
When I scroll down to see Have a Care free trip
Then I see Preparing for your trip with 3 sub options
And I should see at the airport with 3 sub options
And I should see at your destination with 3 sub options
When I scroll down to see Newsletter subscription
Then I see Options to enter email address
And I see button to click subscribe
And I should see Can we help yout title
And I should see option to enter question
And I should see option to search
And I should see 4 social media icons


























