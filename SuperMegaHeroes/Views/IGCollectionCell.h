//
//  IGCollectionCell.h
//  SuperHeroes
//
//  Created by Igor Guk on 23.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGHeroes;

@interface IGCollectionCell : UICollectionViewCell

- (void)setupWithHero:(IGHeroes *)hero;

@end
