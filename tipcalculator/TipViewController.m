//
//  TipViewController.m
//  tipcalculator
//
//  Created by Edo williams on 9/17/13.
//  Copyright (c) 2013 Edo williams. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

//Create Properties for the UI Labels and Controls
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;


- (IBAction)onTap:(id)sender;//Using the Gesture Recognizer create a method
- (void)updateValues; //Calculate Tip and update Label

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues]; //clear out labels when first load
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
   
    [self.view endEditing:YES]; //Dismiss the Keyboard
    [self updateValues]; //wire up the event for updateValues
}

- (void)updateValues {
    //set values here
    float billAmout = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)]; //array of NSNumbers to do the tip calculations
    
    //Calculate Tip Amount
    float tipAmount = billAmout * [tipValues[self.tipControl.selectedSegmentIndex] floatValue]; //access the tip value from array above
    
    //Calculate total amount
    float totalAmount = tipAmount + billAmout;
    
    //Update Label
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

@end
