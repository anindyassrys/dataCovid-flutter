# 📱 About DataCovid App

[![pipeline status](https://gitlab.com/dixonfrederick/pbp-flutter/badges/main/pipeline.svg)](https://gitlab.com/dixonfrederick/pbp-flutter/-/commits/main)

## Download Link  APK: 
https://drive.google.com/file/d/1luM7ld1A4No4IuZ8SqOPSara6Bsllscj/view?usp=sharing

## 📚 Story Module and Web Service Implementation
We will create an application that contains valid information about Covid-19, with the aim of educating users. This application will contain things that need to be done or avoided during a pandemic, Covid-19 case data, vaccination information, and other related matters.
The modules that will be implemented in this application will refer to the modules on the [Covid App](http://covid-information-app.herokuapp.com/) website that we created earlier, which are as follows:
1. **Authorization & Authentication** <br>
This module will provide an account to users who register on the [Covid App](http://covid-information-app.herokuapp.com/) site and the stored data will be connected to the existing _database_ in Django. Everything that has been integrated on the site will be implemented in the form of _mobile app_ such as _profile page, login page,_ and _registration page_.
2. **Home & Info about Covid-19** <br>
The main page of the application, which also contains information about Covid-19 that users can view immediately.
3. **Covid-19 case data** <br>
Contains updated data on the number of Covid-19 cases (positive, recovered, died), both nationally and in various regions in Indonesia.
4. **Info regarding vaccines** <br>
Just like its function on the [Covid App](http://covid-information-app.herokuapp.com/) website, this module will display the number of people who have carried out both the first and second vaccinations based on their category (the data involved is not a actual data). This module will also make _requests_ to the Django _database_ so that later the displayed data can be uniform with the data on the [Covid App] site (http://covid-information-app.herokuapp.com/).
5. **Vigilance index for each region** <br>
This module will display an alert index with several categories, as implemented on the [Covid App](http://covid-information-app.herokuapp.com/) website, via an iframe which in flutter, can be displayed with a WebView or [InAppWebView ](https://newbedev.com/flutter-loading-an-iframe-from-webview). The iframe data that will be displayed is retrieved by the GET method on Django's _database_ views, which will return a JsonResponse in the form of the iframe name and source data. For users who are admins, they will be able to add names and sources for other index categories.
6. **Hospital referral** <br>
The module works the same as on the [Covid App](http://covid-information-app.herokuapp.com/) website, showing a list of referral hospitals that are model objects in the Django database. If the user is an admin, can add a referral hospital.
7. **Forum Discussion** <br>
This module is an implementation of a discussion forum around Covid-19, which can be filled in by Users (logged-in users).

## 🔖 Benefits
The benefit that we want to give to the public from this application is to provide accurate information regarding Covid-19, so that it is hoped that it can assist in educating and increasing public awareness of Covid-19 and suppressing the increase in Covid-19 cases in Indonesia.

## 👩 Persona
- Guest Mode: can view existing information, but cannot join or post on discussion forums.
- Users: can see all the information on the website, and can join forum discussions and can post in forum discussions, but cannot delete posts on forum discussions.
- Administrator: can delete posts that have been posted on the forum discussion.
