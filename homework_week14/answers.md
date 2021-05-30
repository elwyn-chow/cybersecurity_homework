## Week 14 Homework: Web Development

#### HTTP Requests and Responses

Answer the following questions about the HTTP request and response process.

1. What type of architecture does the HTTP request and response process occur in?

Client-server architecture.

2. What are the different parts of an HTTP request? 

* Request line
* Headers
* Request body

3. Which part of an HTTP request is optional?

The request body.

4. What are the three parts of an HTTP response?

* Status line
* Headers
* Reqsponse body

5. Which number class of status codes represents errors?

* 300 codes- multiple choices, meaning the server can respond to the request in more than one way.
* 400 codes indicate client errors
* 500 codes indicate server errors

6. What are the two most common request methods that a security professional will encounter?

* GET
* POST

7. Which type of HTTP request method is used for sending data?

Put

8. Which part of an HTTP request contains the data being sent to the server?

HTTP Request body

9. In which part of an HTTP response does the browser receive the web code to generate and style a web page?

Status

#### Using curl

Answer the following questions about `curl`:

10. What are the advantages of using `curl` over the browser?

* Can be run from command line and doesn't need a graphical user interface
* It is fast and easy to use for download things or to check that a web server or page is responding correctly
* It is a small download and quick to configure.
* It has numerous options that a graphical browser doesn't have. These include the ability to modify its headers to appear to be a different sort of browser.

11. Which `curl` option is used to change the request method?

* -X
* --request

12. Which `curl` option is used to set request headers?

* -H
* --header

13. Which `curl` option is used to view the response header?

*  -I
* --head

14. Which request method might an attacker use to figure out which HTTP requests an HTTP server will accept?

OPTIONS

#### Sessions and Cookies

Recall that HTTP servers need to be able to recognize clients from one another. They do this through sessions and cookies.

Answer the following questions about sessions and cookies:

15. Which response header sends a cookie to the client?

    ```HTTP
    HTTP/1.1 200 OK
    Content-type: text/html
    Set-Cookie: cart=Bob
    ```

Set-Cookie: cart=Bob

16. Which request header will continue the client's session?

    ```HTTP
    GET /cart HTTP/1.1
    Host: www.example.org
    Cookie: cart=Bob
    ```

Cookie: cart=Bob

#### Example HTTP Requests and Responses

Look through the following example HTTP request and response and answer the following questions:

**HTTP Request**

```HTTP
POST /login.php HTTP/1.1
Host: example.com
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 34
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Mobile Safari/537.36

username=Barbara&password=password
```

17. What is the request method?

POST

18. Which header expresses the client's preference for an encrypted response?

Upgrade-Insecure-Requests: 1

19. Does the request have a user session associated with it?

No

20. What kind of data is being sent from this request body?

Login data that is unencrypted

**HTTP Response**

```HTTP
HTTP/1.1 200 OK
Date: Mon, 16 Mar 2020 17:05:43 GMT
Last-Modified: Sat, 01 Feb 2020 00:00:00 GMT
Content-Encoding: gzip
Expires: Fri, 01 May 2020 00:00:00 GMT
Server: Apache
Set-Cookie: SessionID=5
Content-Type: text/html; charset=UTF-8
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type: NoSniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block

[page content]
```

21. What is the response status code?

200 - OK

22. What web server is handling this HTTP response?

Apache

23. Does this response have a user session associated to it?

Yes: "Set-Cookie: SessionID=5"

24. What kind of content is likely to be in the [page content] response body?

A login accepted page

25. If your class covered security headers, what security request headers have been included?
26. 
```HTTP
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type: NoSniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
```

#### Monoliths and Microservices

Answer the following questions about monoliths and microservices:

26. What are the individual components of microservices called?

Containers

27. What is a service that writes to a database and communicates to other services?

I'm not sure the correct answer to this.
A *query* is what writes to a database. 
I think most of the containers are using *SSH* to communicate with each other. 
The simplest network in Docker is the bridge network. It’s also Docker’s default networking driver. https://www.tutorialworks.com/container-networking/

28. What type of underlying technology allows for microservices to become scalable and have redundancy?

Platform as a service?

#### Deploying and Testing a Container Set

Answer the following questions about multi-container deployment:

29. What tool can be used to deploy multiple containers at once?

Ansible playbook

30. What kind of file format is required for us to deploy a container set?

YAML

#### Databases

31. Which type of SQL query would we use to see all of the information within a table called `customers`?

SELECT

eg

```SQL
SELECT * from customers
```


32. Which type of SQL query would we use to enter new data into a table? (You don't need a full query, just the first part of the statement.)

INSERT INTO

33. Why would we never run `DELETE FROM <table-name>;` by itself?

It would delete EVERY row of data from the table.

---

### Bonus Challenge Overview: The Cookie Jar

#### Step 3: Using Forms and a Cookie Jar

Navigate to `~/Documents` in a terminal to save your cookies.

1. Construct a `curl` request that enters two forms: `"log={username}"` and `"pwd={password}"` and goes to `http://localhost:8080/wp-login.php`. Enter Ryan's credentials where there are placeholders.

**Note:My Wordpress is running on port 8081, not 8080**

    - **Question:** Did you see any obvious confirmation of a login? (Y/N)

Not obvious. It generated a [302](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/302) (redirect) status. From the [response](3_1_response.txt)'s Location field, we can see that it will redirect to http://localhost:8081/wp-admin/ which is a page authenticated users can use.


curl --form "log=Ryan" --form "pwd=123456" http://localhost:8081/wp-login.php --verbose

[302 Response](3_1_response.txt)

2. Construct the same `curl` request, but this time add the option and path to save your cookie: `--cookie-jar ./ryancookies.txt`. This option tells `curl` to save the cookies to the `ryancookies.txt` text file.

curl --cookie-jar ./ryancookies.txt --form "log=Ryan" --form "pwd=123456" http://localhost:8081/wp-login.php --verbose

[200 Response](3_2_response.txt) 

3. Read the contents of the `ryancookies.txt` file.

   - **Question:** How many items exist in this file?

Three

```text
#HttpOnly_localhost	FALSE	/wp-content/plugins	FALSE	0	wordpress_8dec71ede39ad9ff3b3fbc03311bdc45	Ryan%7C1622564805%7CYgRKW8hImsilsI8auYu7fhfnUrgqbyLkM6Yn4Fl5zXl%7C430178c467e504b7ee85b397a14e4347a28a72dd9171097e6f1513907682ae87
#HttpOnly_localhost	FALSE	/wp-admin	FALSE	0	wordpress_8dec71ede39ad9ff3b3fbc03311bdc45	Ryan%7C1622564805%7CYgRKW8hImsilsI8auYu7fhfnUrgqbyLkM6Yn4Fl5zXl%7C430178c467e504b7ee85b397a14e4347a28a72dd9171097e6f1513907682ae87
#HttpOnly_localhost	FALSE	/	FALSE	0	wordpress_logged_in_8dec71ede39ad9ff3b3fbc03311bdc45Ryan%7C1622564805%7CYgRKW8hImsilsI8auYu7fhfnUrgqbyLkM6Yn4Fl5zXl%7C326fa3079100d3d7706cefb7e4737332d18d28ab603b9138a0a4f7a7ed165db9
```

[ryancookies.txt](ryancookies.txt)

#### Step 4: Log in Using Cookies

1. Craft a new `curl` command that now uses the `--cookie` option, followed by the path to your cookies file. For the URL, use `http://localhost:8080/wp-admin/index.php`.

curl --cookie ./ryancookies.txt http://localhost:8081/wp-admin/index.php --verbose

[200 Response](4_1_response.txt) 

   - **Question:** Is it obvious that we can access the Dashboard? (Y/N)

Yes, especially when opening it in a graphical web browser.

[HTML only](4_1_response.html) 
[Web page picture](4_1_response.JPG) 

2. Press the up arrow on your keyboard to run the same command, but this time, pipe `| grep Dashboard` to the end of your command to return all instances of the word `Dashboard` on the page.

    - **Question:**  Look through the output where `Dashboard` is highlighted. Does any of the wording on this page seem familiar? (Y/N) If so, you should be successfully logged in to your Editor's dashboard.

#### Step 5: Test the Users.php Page

1. Finally, write a `curl` command using the same `--cookie ryancookies.txt` option, but attempt to access `http://localhost:8080/wp-admin/users.php`.

    - **Question:** What happens this time?

---

### Submission Guidelines

* Save the file where you documented your solutions and submit it as your homework deliverable. 

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  
