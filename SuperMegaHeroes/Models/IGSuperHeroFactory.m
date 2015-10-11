//
//  IGSuperHeroFactory.m
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGSuperHeroFactory.h"

@implementation IGSuperHeroFactory

+ (IGHero *)heroWithName:(NSString *)name andImage:(UIImage *)nameImage {
    IGHero *newHero = [[IGHero alloc] initWithString:name andImageName:nameImage];
    return newHero;
}

@end
