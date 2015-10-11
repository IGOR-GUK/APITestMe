//
//  IGCollectionViewController.m
//  SuperHeroes
//
//  Created by Igor Guk on 23.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGCollectionViewController.h"
#import "IGHeroDataSource.h"
#import "IGCollectionCell.h"

@interface IGCollectionViewController () < UICollectionViewDataSource,
                                           UICollectionViewDelegate,
                                           NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) IGHeroDataSource *data;
@property (nonatomic, strong) NSMutableArray *itemChanges;

@end

@implementation IGCollectionViewController

- (IGHeroDataSource *)data {
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[IGHeroDataSource alloc] initWithDelegate:self];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.data countOfHeroes];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifaer = @"CollectionCell";
    
    IGCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifaer forIndexPath:indexPath];
   // NSInteger row = [indexPath row];
    [cell setupWithHero:[self.data heroAtIndexPath:indexPath]];

    
    return cell;
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    CGPoint locationPoint = [sender locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:locationPoint];
    if (sender.state == UIGestureRecognizerStateBegan && indexPath) {
        IGHeroDataSource *ad = [[IGHeroDataSource alloc] init];
        [ad deleteModelAtIndex:indexPath];
    }
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    self.itemChanges = [[NSMutableArray alloc] init];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    NSMutableDictionary *change = [[NSMutableDictionary alloc] init];
    switch(type) {
        case NSFetchedResultsChangeInsert:
            change[@(type)] = newIndexPath;
            break;
        case NSFetchedResultsChangeDelete:
            change[@(type)] = indexPath;
            break;
        case NSFetchedResultsChangeUpdate:
            break;
        case NSFetchedResultsChangeMove:
            break;
    }
    [self.itemChanges addObject:change];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.collectionView performBatchUpdates:^{
        
        for (NSDictionary *change in self.itemChanges) {
            [change enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                NSFetchedResultsChangeType type = [key unsignedIntegerValue];
                switch(type) {
                    case NSFetchedResultsChangeInsert:
                        [self.collectionView insertItemsAtIndexPaths:@[obj]];
                        break;
                    case NSFetchedResultsChangeDelete:
                        [self.collectionView deleteItemsAtIndexPaths:@[obj]];
                        break;
                    case NSFetchedResultsChangeUpdate:
                        break;
                    case NSFetchedResultsChangeMove:
                        break;
                }
            }];
        }
    } completion:^(BOOL finished) {
        self.itemChanges = nil;
    }];
}


@end
