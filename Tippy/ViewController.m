//
//  ViewController.m
//  Tippy
//
//  Created by Julie Herrick on 6/23/20.
//  Copyright © 2020 Julie Herrick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *tipBar;
@property (weak, nonatomic) IBOutlet UIView *totalBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *percentageBar;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)onTap:(id)sender {
//    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    
    double tip = tipPercentage * bill;
    double total = bill+tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
   [UIView animateWithDuration:0.3 animations:^{
          self.tipBar.hidden = YES;
          self.totalBar.hidden = YES;
          self.percentageBar.hidden = YES;
          self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y+100, self.billField.frame.size.width, self.billField.frame.size.height);
      }];
      


    
   
}

- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 100;
    [UIView animateWithDuration:.2 animations:^{
        self.billField.frame = newFrame;
        self.tipBar.hidden = NO;
        self.totalBar.hidden = NO;
        self.percentageBar.hidden = NO;
    }];


    
}


@end
