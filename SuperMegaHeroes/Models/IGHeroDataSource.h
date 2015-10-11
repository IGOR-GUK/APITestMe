//
//  IGHeroDataSource.h
//  SuperHeroes
//
//  Created by Igor Guk on 11.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class IGHeroes;

@interface IGHeroDataSource : NSObject

- (IGHeroes *)heroAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)countOfHeroes;
- (void)addModelWithImagePath:(NSString *)imagePath name:(NSString *)name;
- (instancetype)initWithDelegate:(id<NSFetchedResultsControllerDelegate>)delegate;
- (void)saveContext;
- (void)deleteModelAtIndex:(NSIndexPath *)index;

@end
