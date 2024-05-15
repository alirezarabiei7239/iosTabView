# iosTabView

# TabbedPageViewController

TabbedPageViewController is an Objective-C library for iOS that allows developers to easily create a swipeable, tabbed interface similar to Android's TabLayout. This custom view controller integrates a `UIPageViewController` for swipeable pages and a `UIScrollView` for scrollable tabs.

## Features

- Simple and easy to integrate into any Objective-C iOS project.
- Supports custom tab titles and multiple view controllers.
- Allows for dynamic switching and swiping between view controllers.

## Requirements

- iOS 11.0 or later
- Objective-C
- Xcode 10.0 or later

## Installation

To use TabbedPageViewController in your project, simply:

1. Download the `TabbedPageViewController.h` and `TabbedPageViewController.m` files.
2. Drag and drop these files into your Xcode project.
3. Ensure that the files are correctly linked to your target.

## Usage

### Setting Up

To integrate the TabbedPageViewController into your iOS application, perform the following steps:

1. Import the `TabbedPageViewController` in your AppDelegate or wherever you manage your UI setup:

   ```objc
   #import "TabbedPageViewController.h"

2.Create instances of UIViewController that will serve as the content for each tab:

   ```objc
   UIViewController *firstViewController = [[UIViewController alloc] init];
   firstViewController.view.backgroundColor = [UIColor redColor];
   UIViewController *secondViewController = [[UIViewController alloc] init];
   secondViewController.view.backgroundColor = [UIColor greenColor];
   UIViewController *thirdViewController = [[UIViewController alloc] init];
   thirdViewController.view.backgroundColor = [UIColor blueColor];
```
3.Initialize the TabbedPageViewController with tab titles and view controllers:
 ```objc
   NSArray *viewControllers = @[firstViewController, secondViewController, thirdViewController];
   NSArray *tabTitles = @[@"First", @"Second", @"Third"];

   TabbedPageViewController *tabbedPageViewController = [[TabbedPageViewController alloc] initWithTabTitles:tabTitles viewControllers:viewControllers];

```
4.Set the TabbedPageViewController as the root view controller in your AppDelegate or push it onto your navigation stack:

```objc
  self.window.rootViewController = tabbedPageViewController;
  [self.window makeKeyAndVisible];
```

Customization
To customize the appearance or behavior of the tabs or the page transitions, modify the setupTabScrollView and setupPageViewController methods in the TabbedPageViewController.m file.








