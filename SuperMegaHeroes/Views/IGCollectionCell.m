//
//  IGCollectionCell.m
//  SuperHeroes
//
//  Created by Igor Guk on 23.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGCollectionCell.h"
#import "IGHeroes.h"

@interface IGCollectionCell ()

@property (nonatomic, weak) IBOutlet UIImageView *heroImageView;

@end

@implementation IGCollectionCell

- (void)setupWithHero:(IGHeroes *)hero {
    self.heroImageView.image = [UIImage imageNamed:hero.imageName];
}

@end
