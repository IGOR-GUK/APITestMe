//
//  IGAddHeroesViewController.h
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGHeroDataSource;

@interface IGAddHeroesViewController : UIViewController

- (void)setDataSource:(IGHeroDataSource *)data;

@end
