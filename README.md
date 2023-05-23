# WeatherApp

Programming language: swift 

Design Pattern: MVVM and clean architecture 

Framework: swiftUI

Minimum deployment target: iOS 15.0

This iOS application is designed to display the weather of 5 cities in France.

# Description

The mobile application provides users a real-time weather information for multiple cities. It follows a straightforward process to fetch and display the data. 
The application consists of the following screens and features:

Welcome Screen: The initial screen welcomes the user with a message and a button to proceed further.

Progress Gauge Screen: The second screen have a percentage progress gauge. The gauge gradually fills up to 100% within a span of 60 seconds, indicating the progress of data retrieval. A  message is displayed above the gauge, keeping the user informed about the ongoing process.

Weather API: The application interacts with the OpenWeatherMap API (https://openweathermap.org/current). Every 10 seconds, the application makes a call to the API to fetch data for five different cities. The cities are requested in the following sequence: Rennes at 0 seconds, Paris at 10 seconds, Nantes at 20 seconds, Bordeaux, and Lyon. 

Results Display: Once the progress gauge reaches 100%, the application presents the obtained weather results in a table format. 

Restart Functionality: After displaying the results, the progress gauge transforms into a "Restart" button. This enables users to initiate the data retrieval process again.

# IMPLEMENTATION

![Simulator Screen Recording - iPhone 14 - 2023-05-23 at 18 46 20](https://github.com/mDaemi/WeatherApp/assets/31176385/40c06a88-a16e-4982-aba8-2ef77fae3f03)

