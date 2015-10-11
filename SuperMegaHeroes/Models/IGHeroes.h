//
//  IGHeroes.h
//  SuperMegaHeroes
//
//  Created by Igor Guk on 02.10.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface IGHeroes : NSManagedObject

@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSString * name;

@end
