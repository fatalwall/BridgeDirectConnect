Bridge Direct Connect is an ASP.Net web application that minimizes manual keying for AT&T Conference bridges. It can eliminate Domain users form the need of providing any information and reduces the input for non domain users such as vendors or contractors. The base page allows for a bridge owner to enter an access code and have a list of connection details generated that can be pasted into the body of a calendar invitation. 

The design is to eliminate situation where you will may spending 15+ minutes at the beginning of a call helping users connect to the web presentation. Normally caused by incorrect keying of the meeting number and/or access code.

**Implementation**

- Prerequisites
  - IIS 7 +
  - IIS feature asp.net 4.5 is installed
  - URL Rewrite installed (https://www.iis.net/downloads/microsoft/url-rewrite)
- From Internet Information Services (IIS) Manager
- Create a new website
- Copy code into web directory
- Full Install
  - Right click folder External and click Convert to Application
  - Right click folder Internal and click Convert to Application
  - Copy **Web - windows.config** and name it **Web.config**
  - Verify Authentication for the Website and 2 applications
    - Website - Anonymous Authentication
    - External - Anonymous Authentication
    - Internal - Windows Authentication
-  Anonymous Only
  - Right click folder External and click Convert to Application
  - Right click folder Internal and click Delete
  - Copy **Web - anonymous.config** and name it **Web.config**
  - Verify Authentication for the Website and application
    - Website - Anonymous Authentication
    - External - Anonymous Authentication

**Validation**

- Calendar Invite Details
  - Open http://[root]/ in your web browser from a domain
  - Enter Accesses Code #######
  - Click Create Calendar Invite Details
- Domain Assets	
  - Open http://[root]/####### in your web browser from a domain
  - You should automatically be transitioned to AT&T conference page asking if your a host or participant
- Domain Assets without access code
  - Open http://[root]/ in your web browser from a domain
  - Enter Accesses Code #######
  - Click Join Meeting
- Non Domain Assets
  - Open http://[root]/External/####### in your web browser
  - Enter a First Name, Last Name, and Email.
  - Click Submit
  - You should be transferred to AT&T conference page asking if your a host or participant
- Non Domain Assets without access code
  - Open http://[root]/External in your web browser
  - Enter Accesses Code #######
  - Enter a First Name, Last Name, and Email.
  - Click Join Meeting
  - You should be transferred to AT&T conference page asking if your a host or participant
