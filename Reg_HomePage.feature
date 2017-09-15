@HomePage
Feature: Regression testing of Home Page

@REG_HOMEPAGE_TC01 @Priority1
Scenario: Search flight for one way trip
Given I am on the Transavia homepage
When I enter Departure station as "Groningen, Netherlands"
And I enter Arrival station as "Almeria, Spain"
And I select Depart Date as "17 Sep 2017"
And I update "2" Adult "2" Children "1" Babies 
And I select option Show prices in Flying Blue Miles
And I click on Search button
Then I should see Book a Flight Page with flight options

@REG_HOMEPAGE_TC02 @Priority1
Scenario: Verify different options displayed in home page 
Given I am on the Transavia homepage
Then I verify the hearder links
When I scroll down
Then I should see Manage your booking pannel
And I should see Online Check In pannel
When I scroll down
Then I should see our top destinations
When I scroll down
Then I should see view all our destinations
When I scroll down
Then I see 3 options under have a carefree trip
When I scroll down
Then I should see option for Newsletter subscription
And I should see Can we help you with social media icons
And I verify the footer options




 

