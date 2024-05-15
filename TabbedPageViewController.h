//
//  TabbedPageViewController.h
//  Telegraph
//
//  Created by Alireza on 5/15/24.
//

#import <UIKit/UIKit.h>

@interface TabbedPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) UIScrollView *tabScrollView;
@property (nonatomic, strong) NSMutableArray<NSString *> *tabTitles;
@property (nonatomic, strong) NSMutableArray<UIViewController *> *viewControllers;

- (instancetype)initWithTabTitles:(NSArray<NSString *> *)titles viewControllers:(NSArray<UIViewController *> *)viewControllers;

@end
