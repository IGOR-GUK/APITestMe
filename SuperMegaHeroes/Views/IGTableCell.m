//
//  IGTableCell.m
//  SuperHeroes
//
//  Created by Igor Guk on 08.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGTableCell.h"
#import "IGHeroes.h"

@interface IGTableCell ()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbImage;

@end

@implementation IGTableCell

- (void)setupWithHero:(IGHeroes *)hero {
    self.nameLabel.text = hero.name;
    self.thumbImage.image = [UIImage imageNamed:hero.imageName];
}

@end
