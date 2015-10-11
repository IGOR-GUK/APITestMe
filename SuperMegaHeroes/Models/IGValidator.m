//
//  IGValidator.m
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGValidator.h"

static NSInteger const kMinTitleLength = 3;

@implementation IGValidator

- (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error {
    if (title.length < kMinTitleLength) {
        NSString *descriptionString = @"Please!";
        NSString *reasonString = [NSString stringWithFormat:@"Text can not contain less than %i symbols", kMinTitleLength];
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey: NSLocalizedString(descriptionString, nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(reasonString, nil)};
        *error = [NSError errorWithDomain:@"HeroErrorDomain"
                                     code:-57
                                 userInfo:userInfo];
        return NO;
    }
    return YES;
}

@end
