//
//  IGSuperHeroFactory.h
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGHero.h"

@interface IGSuperHeroFactory : NSObject

+ (IGHero *)heroWithName:(NSString *)name andImage:(UIImage *)nameImage;

@end
