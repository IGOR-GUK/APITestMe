//
//  IGTableViewController.m
//  SuperHeroes
//
//  Created by Igor Guk on 07.08.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGTableViewController.h"
#import "IGTableCell.h"
#import "IGHeroDataSource.h"

@interface IGTableViewController () <UITableViewDataSource,
                                     UITableViewDelegate,
                                     NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) IGHeroDataSource *data;

@end

@implementation IGTableViewController

- (IGHeroDataSource *)data {
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[IGHeroDataSource alloc] initWithDelegate:self];
}

#pragma mark - TableViewDataSource
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data countOfHeroes];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifaer = @"TableCell";
    
    IGTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifaer forIndexPath:indexPath];
    
    [cell setupWithHero:[self.data heroAtIndexPath:indexPath]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"RATING SUPER HEROES";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.data deleteModelAtIndex:indexPath];
    }
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath]
                                  withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                                  withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            break;
            
        case NSFetchedResultsChangeMove:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end
