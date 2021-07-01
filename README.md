# Introduction

This project is to help my uncle manage the inventory data of his leather boutique store, and help me practice what I have learned at school/during my Co-op. 

The features include product save/update/delete/search.

Primary data analysis features include monthly/seasonal sales data viewing.

Store employees have to sign in to edit the data.

Greatly appreciate my uncle to provide the chance to work on this real-based project

# Front-end Part (Working)




#### nav-bar.js

Using recursive rendering, if you want to change the content, just change the ./component/_nav.js file

By clicking the nav brand, viewSideBar() will be called, and this will change side bar visibility.

#### side-bar.js

Side bar visibility can be changed by calling viewSideBar() in App.js. Side bar items are imported through ./component/_sidebar.js file




# Back-end Part (Working)

The front end is implemented with Springboot, JPA, Hibernate, Spring Security, Lombok


# Database Part(Completed)

### DBMS MySQL
[Sql file to build the database and insert testing data](Store_data.sql)






#### View

1. For each product ID, list how many product are in the store inventory and warehouse inventory

User(s): Store Manager, warehouse employee, salespeople

Purpose: Provides the  inventory information of all the product


# Testing

#### front-end

Selenium WebDriver

#### back-end

Junit


# How to run
Load the project backend in intelij and run
or 
Use command line:  mvn spring-boot:run

# Front end
go to : product management\product Management\src\main\webApp\reactjs

# Run yarn install
Yarn start

Login details are user name  admin pass admin
