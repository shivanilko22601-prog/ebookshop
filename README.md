<<<<<<< HEAD
# E-Book Shop college demo

This is a small JSP and Servlet college project. It starts an embedded H2 database and loads demo data automatically, so **you do not need to install or start MySQL**.

## What you need

- JDK 17 or newer
- Apache Tomcat 10.1 or 11
- Maven 3.8 or newer

## Database setup

The app creates the database tables and sample books when Tomcat starts. The demo administrator is `admin@ebookshop.local` with password `admin123`.

The embedded database is in memory, so sample accounts and any books/accounts added during the presentation reset when Tomcat stops. `database/setup.sql` is provided only if you later choose to use MySQL instead. To use MySQL, edit the `DB_URL`, `DB_USER`, and `DB_PASSWORD` context parameters in `src/main/webapp/WEB-INF/web.xml`.

## Run in Eclipse

1. Import the `ebshop` folder as an **Existing Maven Project**.
2. Set the project JRE to JDK 17 or newer and add a Tomcat 10.1/11 server.
3. Run `Maven > Update Project`, then add `ebshop` to the server and start it.
4. Let Eclipse download the Maven dependencies, start Tomcat, and open `http://localhost:8080/ebshop/`.

## Build a WAR

From the `ebshop` folder run `mvn package`, then deploy `target/ebshop.war` to Tomcat 10.1/11. No separate database service is needed.

## Demo flow

Log in as the demo admin, add a book using **Book Entry Form**, then log out and sign up as a student. Browse the engineering categories, add books to the cart, and show the cart total. Password recovery uses the security question and answer saved during signup.

This is a classroom demo, not a production store. Passwords are stored as plain text and there is no payment or order processing.
=======
# ebookshop
>>>>>>> 574108769328a92ad17220192ea41c2bb529fc0a
