# Serendib Tourist Sites

A Java web application for exploring tourist destinations in Sri Lanka and managing tour packages, hotel listings, and bookings. The application uses JSP pages for its interface, Java servlets for request handling, and MySQL for persistence.

## Features

- Browse destination and travel pages, including beach, adventure, and heritage attractions.
- Register and sign in as a tourist, guide, hotel manager, or administrator.
- Browse and manage tour packages, hotel listings, and bookings.
- View role-specific dashboards and user profiles.

## Technology

- Java Servlets and JSP (`javax.servlet`)
- MySQL with JDBC
- HTML, CSS, and JSP views

## Prerequisites

- A JDK compatible with your servlet container
- Apache Tomcat 9 or another container that supports `javax.servlet`
- MySQL Server
- MySQL Connector/J

There is no Maven or Gradle build file in this repository. Configure the project as a Java web application in your IDE or build environment, and make the Servlet API and MySQL Connector/J available to it.

## Database setup

The application expects a MySQL database named `serendib`. Its services use the `users`, `hotels`, `tour_packages`, and booking-related tables. A database schema or seed-data script is not currently included, so create the schema expected by the Java service classes before running the application.

Database connection settings are currently defined in `src/main/java/Utils/DBConnect.java`. Configure them for your local MySQL instance before starting the app. Do not commit real credentials; use environment-specific or secret-managed configuration for anything beyond local development.

## Run locally

1. Set up MySQL and create the required schema.
2. Configure the local database connection in `DBConnect.java`.
3. Build/deploy the project as a web application to Tomcat 9.
4. Start Tomcat and open the deployed application in a browser. The welcome page is `index.jsp`.

## Project layout

```text
src/
  main/
    java/
      Model/       Application data models
      Services/    Database-backed application services
      Servlet/     HTTP request handlers
      Utils/       Shared utilities, including database connection
    webapp/
      WEB-INF/     Web application configuration
      *.jsp        Pages and views
      css/         Stylesheets
      images/      Image assets
```
