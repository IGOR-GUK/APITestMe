//
//  IGValidator.h
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IGValidator : NSObject

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error;

@end
