//
//  IGViewController.m
//  SuperHeroes
//
//  Created by Igor Guk on 24.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGViewController.h"
#import "IGContainerViewController.h"

@interface IGViewController ()

@property (nonatomic, weak) IGContainerViewController *containerViewController;

- (IBAction)swapBarButton:(id)sender;

@end

@implementation IGViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)swapBarButton:(id)sender {
    [self.containerViewController swapViewControllers];
}

@end
