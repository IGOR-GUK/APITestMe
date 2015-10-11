//
//  IGAddHeroesViewController.m
//  IGhero
//
//  Created by Igor Guk on 08.09.15.
//  Copyright (c) 2015 Igor Guk. All rights reserved.
//

#import "IGAddHeroesViewController.h"
#import "IGValidator.h"
#import "IGHeroDataSource.h"
#import "IGTableViewController.h"

@interface IGAddHeroesViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameModelField;
@property (nonatomic, strong) IGValidator *validator;
@property (nonatomic, strong) IGHeroDataSource *data;

@end

@implementation IGAddHeroesViewController

- (void)setDataSource:(IGHeroDataSource *)data {
    _data = data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.validator = [IGValidator new];
    [self.nameModelField becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)actionSave:(id)sender {
    NSError *error = nil;
    if ([self.validator isValidModelTitle:self.nameModelField.text error:&error]) {
        [self saveData];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIAlertView *showAlert = [[UIAlertView alloc] initWithTitle:error.localizedDescription message:error.localizedFailureReason delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [showAlert show];
    }
}

- (void)saveData {
    
    IGHeroDataSource *ad = [[IGHeroDataSource alloc] init];
    
    [ad addModelWithImagePath:@"batman1.png" name:self.nameModelField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameModelField resignFirstResponder];
    return NO;
}

@end
