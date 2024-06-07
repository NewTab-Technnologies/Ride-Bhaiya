# ridebhaiya

A new Flutter project.

# Table of Contents
&nbsp;1. [Introduction](#intro)  
&nbsp;2. [Getting Started](#gs)  
&nbsp;3. [Features](#f)  
&nbsp;4. [Dependencies](#d)  
&nbsp;5. [Project Structure](#ps)  
&nbsp;6. [Code Overview](#co)  
&nbsp;7. [How to Run](#hr)

<a name = "intro"></a>

## Introduction
**Ride Bhaiya** is a ride sharing app which is convinient and easy to follow .We built this app using flutter and firebase,through maps user can schedule and request nearby cabs.  
(_Maps not implement yet_)

<a name = "gs"></a>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<a name = "f"></a>

## Features
_< Space to add features >_

<a name = "d"></a>

## Dependencies
_< Space to add dependencies >_

<a name = "ps"></a>

## Project Structure
This app consists of several _Screens_ and _Widgets_:
* [Screen Files](#s)
* [Widgets](#w)

<a name = "s"></a>

### Screen Files
* [splash_screen.dart](#1)
* [welcomescreen.dart](#2) 
* [get_otp_screen.dart](#3) 
* [otp_verification_screen.dart](#4) 
* [success.dart](#5)
* [home_screen_tab_structure.dart](#6)
* [offer_ride_screen.dart](#7)
* [get_ride_screen.dart](#8)
* [request_success_screen.dart](#9)
* [schedule_screen.dart](#10)
* [request_screen.dart](#11)
* [confirm.dart](#12)
* [view_schedule_screen.dart](#13)
* [view_requests_screen](#14)

<a name = "1"></a>

### splash_screen.dart 
- This file contains a **stateful widget** named `SplashScreen`.
- It displays 'RB' text .
- **Automatic Navigation**: Redirects the user to the Welcome Screen after a 3-seconds.

<a name = "2"></a>

### welcomescreen.dart
- This file contains a **stateful widget** named `WelcomeScreen` that shows up from home screen.

- The `WelcomeScreen` serves as the entry point for users, providing options to either _sign up_ or _log in_.

- It consists of two elevated buttons :
    - `Sign Up`: New users can sign up by navigating to the OTP screen.
    - `Login`: Existing users can log in by navigating to the OTP screen.

- Privacy: The application emphasizes user privacy by not collecting any personal information other than the phone number.

<a name = "3"></a>

### get_otp_screen.dart
- This file contains a **stateful widget** named `GetOTPScreen`.

-  When the user is logging in welcome screen it navigates to `GetOTPScreen`.

-  User needs to enter his phone number to receive otp. If the entered number is invalid, it will display **Invalid Phone Number**.

- When the user is signing up in welcome screen it navigates to `GetOTPScreen`.

- An input field is where the user enters their username and details.

- **Mobile Number Input**: Users can enter their mobile number to receive an OTP.

- **User Name Input**: During the signup process, users can also provide a username.

- **Get OTP Button**: Provides navigation to the OTP verification screen when user clicks "Get OTP".

<a name = "4"></a>

### otp_verification_screen.dart
- This file contains a **stateful widget** named `OTPVerificationScreen`.

- Displays an input field "_Enter OTP_" where the user needs to enter the received OTP.

- **Verification**: The entered OTP is verified to authenticate the user.

- After the verification of OTP screen it navigates to `SuccessScreen`.

<a name = "5"></a>

### success.dart
- This file contains a **stateful widget** named `SuccessScreen`.

- **Success Message**: Shows text -"_Congratulations Successfully verified_" once the user has been successfully logged in.

- **Automatic Navigation**: Redirects the user to the Home Screen after a 3-seconds.

<a name = "6"></a>

### home_screen_tab_structure.dart
- This file contains 3 **stateful widgets** namely:
    - `HomeScreen`
    - `ScheduleTile`
    - `RequestTile`

- `HomeScreen` is used to display **Latest Schedules** and **Latest Requests** and navigate to `OfferRideScreen` and `GetRideScreen`.

- `HomeScreen` currently has a list of values, passed as parameters in the `ScheduleTile`and `RequestTile`. (_List of values are to be fetched from the database. Currently not implemented._)

- It returns a `DefaultTabController` which has a child widget named `TabBar`, used to switch between **Latest Schedules** and **Latest Requests**.

- It offers us two buttons:
    - `Offer a Ride`
    - `Get a Ride`

- `Offer a Ride` button is used to navigate to `OfferRideScreen` to schedule rides.

- `Get a Ride` button is used to navigate to `GetRideScreen` to request rides.

- `RideDetailsTile` is used in widgets `ScheduleTile` and `RequestTile` to display **Latest Schedules** and **Latest Requests**.

- `ScheduleTile` and `RequestTile` are used inside the widget `TabBarView` and a list of values are passed.

- They accept a list of values.

<a name = "7"></a>

### offer_ride_screen.dart
- This file contains a `stateful widget` named `OfferRideScreen`.

- This screen is used by the owners of the ride to schedule rides and view requests.

- It contaons two buttons:
    - `Schedule a Ride`
    - `View Requests`

- `Schedule a Ride` button is used to navigate to `ScheduleRideScreen` to schedule a ride.

- `View Requests` button is used to navigate to `ViewRequestsScreen` to see all the requests made for the ride.

<a name = "8"></a>

### get_ride_screen.dart
- This file contains a `stateful widget` named `GetRideScreen`.

- This screen is used by the passengers to make requests for a ride and view schedules.

- It contains two buttons:
    - `View Schedules`
    - `Request a Ride`

- `View Schedules` button is used to navigate to `ViewScheduleScreen` to see all the schedules to choose from.

- `Request a Ride` button is used to navigate to `RequestRideScreen` to make requests for a ride.

<a name = "9"></a>

### request_success_screen.dart
- This file contains a **stateful widget** named `RequestSuccessScreen`.

- **Success Message**: Displays text "_Congratulations request successful_" and an icon.

- **Automatic Navigation**: Redirects the user to the Home Screen after a 3-seconds.

<a name = "10"></a>

### schedule_screen.dart
- This file contains a **stateful widget** named `ScheduleRideScreen`.

- This screen is used to enter the details of the ride by the owner of the ride.

- It uses `FormComponent` widget for the above purpose.

- **Schedule Button**: It is an elevated button.

- **Navigation**: Upon pressing the `Schedule` button, the user is navigated to the `ConfirmScreen` using the Navigator.

<a name = "11"></a>

### request_screen.dart
- This file contains a **stateful widget** named `RequestRideScreen`.

- This screen allows users to make requests for rides.

- It uses `FormComponent` widget for the above purpose.

- **Send Request Button**: It is an elevated button.

- **Navigation**: Upon pressing the submit button, the user is navigated to the  `RequestSuccessScreen` using the Navigator.

<a name = "12"></a>

### confirm.dart
- This file contains a `stateful widget` named `ConfirmScreen`.

- This screen is used for the confirmation to successful submission of **Schedule a Ride** form.

- Automatic Navigation: Redirects the user to the Home Screen after a 3-seconds.

<a name = "13"></a>

### view_schedule_screen.dart
- This file contains two **stateful widgets** namely:
    - `ViewScheduleScreen`
    - `ScheduleTile`

- `ViewScheduleScreen` is used to display all the schedules.

- `ViewScheduleScreen` currently has a list of values, passed as parameters in the `ScheduleTile`. (_List of values are to be fetched from the database. Currently not implemented._)

- `RideDetailsTile` is used in widget `ScheduleTile` to display schedule details.

- `ScheduleTile` accepts a list of values.

- `View More` button is disabled by setting flag as false.

- `ScheduleTile` is used inside the `ViewScheduleScreen` and the list of values are passed.

- `ViewScheduleScreen` uses a widget called `SingleChildScrollView` as all the schedules cannot be shown in a static screen. Scrolling through screen enables users to see all schedules.

<a name = "14"></a>

### view_requests_screen.dart
- This file contains two stateful widgets namely:
    - `ViewRequestsScreen`
    - `RequestTile`

- `ViewRequestsScreen` is used to display all the requests.

- `ViewRequestsScreen` currently has a list of values, passed as parameters in the `RequestTile`. (_List of values are to be fetched from the database. Currently not implemented._)

- `RideDetailsTile` is used in widget `RequestTile` to display the request details.

- `RequestTile` accepts a list of values.

- `View More` button is disabled by setting flag as false.

- `RequestTile` is used inside the `ViewRequestsScreen` and the list of values are passed.

- `ViewRequestsScreen` uses a widget called `SingleChildScrollView` as all the requests cannot be shown in a static screen. Scrolling through screen enables users to see all requests.

<a name = "w"></a>
___  
**NOTE:**
- All screens except `SplashScreen` contains an AppBar, which displays title **RIDE BHAIYA**.
- **SingleChildScrollView:** It is a widget that enables scrolling when its child content exceeds the available space.
- All screens are connected using `Navigator.push()` method.
___
### Widgets
* [request_ride_shedule_tile.dart](#15)
* [form_component.dart](#16)

<a name = "15"></a>

### request_ride_schedule_tile.dart
- This is used to display the schedules and request made by the users of the application.

- This is a `user defined widget` which is used in multiple screens.

- It is a `stateful widget` which accepts a list of values and a flag as parameters.

- It returns a container.

- It has a **list of parameters** containing the headers.

- The **list of values** display the details corresponding to these headers.

- It contains two buttons:
    - `Contact`
    - `View More`

- `Contact` button is used to contact the owner of the ride. (Implementation required)

- `View More` button can navigate either to `ViewSchedulesScreen`or to `ViewRequestScreen` which displays all the schedules and requests made.

- `View More` button can be disabled by setting flag as false. (This feature is implemented to use only `Contact` button in certain screens)

- `SingleChildScrollView` is used to make the widget responsive.

<a name = "16"></a>

### form_component.dart
- Reusable form component used to collect ride scheduling information.
- Consists of text input fields for starting point, destination, time, and seating availability.
- This is a user defined widget which is used in multiple screens.
- **starting point**:The starting point is the location from where the ride will begin. Users need to input the location of their starting point.
- `startingPointController` is used to handle the input for the starting point.
- **destination**: The destination is the endpoint of the ride. Users need to input the address or location of their destination. 
- `destinationController` is used to handle the input for the destination.
- **time**:The time field captures when the ride is scheduled to start. we should give time according to the location.
- `timeController` manages the input text for the time.
- **seating availability**: It gives the number of available seats in the vehicle to schedule a ride. 
- **seating for**: It gives no of seats available such that user can book seats to request a ride.
- `seatcontroller` is used to handle the input for the seats.

<a name = "co"></a>

## Code Review

_< Space to add Code Review >_
<a name = "hr"></a>

## How to Run

_< Space to add How to Run >_