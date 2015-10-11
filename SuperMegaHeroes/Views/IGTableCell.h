//
//  IGTableCell.h
//  SuperHeroes
//
//  Created by Igor Guk on 08.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGHeroes;

@interface IGTableCell : UITableViewCell

- (void)setupWithHero:(IGHeroes *)hero;

@end
