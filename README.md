# iOS_UIScreen_2

<img width = "245" height = "500" src = "https://github.com/sembaynaz/iOS_UIScreen_2/assets/96616194/fb0bb4b8-8b89-41e4-941e-ead7f3215b85">
<img width = "245" height = "500" src = "https://github.com/sembaynaz/iOS_UIScreen_2/assets/96616194/4b1860d0-b4e1-4f80-b85f-70ff0f31650f">

## Project Description
The iOS_UIScreen_2 project about how design project in UIKit without storyboard and any libraries. The technoligies that used:
TableView (header, footer),SstackView, UILabel, UIButton, Constraints, TabBar. 

I demonstrate in photos run this project in iPhone 14 pro and iPhone SE

## Installation
No secondary libraries were used here, only **UIKit**. You can download the project from GitHub as a zip file and then open it in the **xCode** application. (No additional installations are required)

## Usage

In the "UIScreens" project, you will find a tab-based user interface consisting of three interconnected screens managed by a `UITabBarController`. Here's how you can make the most of this project:

### Tab Bar Configuration

The `TabBarController.swift` file is responsible for setting up the tab bar and its appearance:

- The `generateTabBar()` function adds view controllers to the tab bar. In this project, it includes the "Главная" (Main), "Отчеты" (Reports), and "Профиль" (Profile) screens. You can easily extend or modify these screens to suit your application's needs.

- The `generateVC(viewController:title:image:)` function configures each view controller with a title and an image to be displayed in the tab bar.

- The `setTabBarAppearance()` function customizes the tab bar's appearance. It sets the tab bar's tint color to black and adds a horizontal line at the bottom. Additionally, it changes the selected image of the "Главная" tab to a different image when selected.

### Main Screen

The "Главная" (Main) screen is the first tab and provides an example of a designed screen. Here's what you can learn from it:

- Custom Cell: You can see how to create a custom table view cell using the `FinanceTableViewCell.swift` file. This cell contains an icon, a title, expenses information, and a description.

- Header and Footer: Inside the `MainViewController.swift` file, you can find the `configureTableView()` function, which demonstrates how to add header and footer views to a table view. The header and footer views are used to create additional visual elements in the table view.

- Data Population: The `setDataArray()` function populates an array of `Finance` objects, which are used to display data in the table view cells. You can replace this data with your own.

- Button Action: The `viewAllButton` has a touch-down action (`touched()`) that prints a message. You can extend this action to perform any desired functionality.

### Reports and Profile Screens

While the "Отчеты" (Reports) and "Профиль" (Profile) screens are included in the project, they are not fully implemented. You can build upon these screens to add features such as detailed cryptocurrency reports and user profile management. Consider this project a starting point for extending the functionality of these screens.

### Additional Details

- The project uses the "Inter" font family for text elements.

- All images used in the project are added to the asset catalog.

By exploring this project, you can gain insights into building a tab-based iOS application, creating custom table view cells, and configuring tab bar controllers. Feel free to use and extend this project as a foundation for your own iOS app development.

## Contribution
Contributions to this project are welcome!
You can organize my code, add a new functionalities, user interface improvments,testing, error handling. 

## Author
git: sembaynaz

mail: nazerke.sembay11@gmail.com 

telegram: @sembaynaz
