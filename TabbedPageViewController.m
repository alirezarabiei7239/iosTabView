//
//  TabbedPageViewController.m
//  Telegraph
//
//  Created by Alireza on 5/15/24.
//

#import "TabbedPageViewController.h"

@interface TabbedPageViewController ()

@end

@implementation TabbedPageViewController

- (instancetype)initWithTabTitles:(NSArray<NSString *> *)titles viewControllers:(NSArray<UIViewController *> *)viewControllers {
    self = [super init];
    if (self) {
        self.tabTitles = [NSMutableArray arrayWithArray:titles];
        self.viewControllers = [NSMutableArray arrayWithArray:viewControllers];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabScrollView];
    [self setupPageViewController];
}

- (void)setupTabScrollView {
    self.tabScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    self.tabScrollView.delegate = self;
    self.tabScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tabScrollView];

    CGFloat xOffset = 0;
    for (NSString *title in self.tabTitles) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(xOffset, 0, 100, 50);
        [button addTarget:self action:@selector(tabTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabScrollView addSubview:button];
        xOffset += 100;
    }
    self.tabScrollView.contentSize = CGSizeMake(xOffset, 50);
}

- (void)setupPageViewController {
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    [self.pageViewController setViewControllers:@[self.viewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)tabTapped:(UIButton *)sender {
    NSUInteger index = [self.tabTitles indexOfObject:sender.titleLabel.text];
    [self.pageViewController setViewControllers:@[self.viewControllers[index]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.viewControllers objectAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound || index >= self.viewControllers.count - 1) {
        return nil;
    }
    return [self.viewControllers objectAtIndex:index + 1];
}

@end
