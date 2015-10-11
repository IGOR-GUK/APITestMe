//
//  IGHero.m
//  SuperHeroes
//
//  Created by Igor Guk on 18.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGHero.h"

@implementation IGHero

- (id)initWithString:(NSString *)name andImageName:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = name;
        _image = image;
    }
    return self;
}

@end
