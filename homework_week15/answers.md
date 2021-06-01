#Web Application 1: Your Wish is My Command Injection

## Mitigation strategies

The server-side code should parse the user input and run validation. 
* It is very easy to write Perl/PHP/Python code to check that the user is entering only a valid IP address. eg check that it matches a regular expression of /^\d+\.\d+\.\d+\.\d+$/
* The HTML code can be written such that a drop down menu shows a whitelist of IP addresses and refuse to run on anythhing that is not on that whitelist.

#Web Application 2: A Brute Force to Be Reckoned With

## Mitigation strategies
* Force users to regularly change their passwords. This may be done by configuring the system to do this automatically.
* Configure the system to temporarily block login attempts from an IP address after numerous failed attempts to login.


