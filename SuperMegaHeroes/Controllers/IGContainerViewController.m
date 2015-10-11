//
//  IGContainerViewController.m
//  SuperHeroes
//
//  Created by Igor Guk on 24.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGContainerViewController.h"
#import "IGTableViewController.h"
#import "IGCollectionViewController.h"

@interface IGContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) IGCollectionViewController *collectionViewController;
@property (strong, nonatomic) IGTableViewController *tableViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation IGContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = @"embedFirst";
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedFirst"]) {
        self.collectionViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:@"embedSecond"]) {
        self.tableViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:@"embedFirst"]) {
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.collectionViewController];
        } else {
            [self addChildViewController:segue.destinationViewController];
            UIView *destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }

    else if ([segue.identifier isEqualToString:@"embedSecond"]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.tableViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers {
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:@"embedFirst"]) ? @"embedSecond" : @"embedFirst";
    
    if (([self.currentSegueIdentifier isEqualToString:@"embedFirst"]) && self.collectionViewController) {
        [self swapFromViewController:self.tableViewController toViewController:self.collectionViewController];
        return;
    }
    
    if (([self.currentSegueIdentifier isEqualToString:@"embedSecond"]) && self.tableViewController) {
        [self swapFromViewController:self.collectionViewController toViewController:self.tableViewController];
        return;
    }
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end
