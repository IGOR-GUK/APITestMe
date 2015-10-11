//
//  IGHero.h
//  SuperHeroes
//
//  Created by Igor Guk on 18.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IGHero : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIImage *image;

- (id)initWithString:(NSString *)name andImageName:(UIImage *)image;

@end
