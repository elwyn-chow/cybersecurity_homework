# Web Application 1: Your Wish is My Command Injection

## Mitigation strategies

* The server-side code should parse the user input and check that it is valid. It is very easy to write Perl/PHP/Python code to check that the user is entering only a valid IP address. eg check that it matches a regular expression of /^\d+\.\d+\.\d+\.\d+$/
* The HTML code can be written such that a drop down menu shows a whitelist of IP addresses and the server-side code refuse to run on anything that is not on that whitelist.
* Completely remove the script. If the functionality is absolutely required, replace it with instructions on how to run ping from command line or outsource to a trusted external website such a https://www.site24x7.com/ping-test.html

# Web Application 2: A Brute Force to Be Reckoned With

## Mitigation strategies
* Require users to regularly change their passwords and not to reuse an old password. This may be done by configuring the system to do this automatically in Linux and Windows.
* Configure the system to temporarily block login attempts from an IP address after 3 failed attempts.
* Consider requiring multi-factor authentication to login.

# Web Application 3: Where's the BeEF?

## Mitigation strategies
* The server-side code needs to check for XSS injections and sanitize it. In this case, it needs to remove any <script> tags.
* The existing messages also need to be checked and sanitized or we could reset the database and lose the data if it isn't essential.
