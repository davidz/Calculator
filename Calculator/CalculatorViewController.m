//
//  CalculatorViewController.m
//  Calculator
//
//  Created by inoyucom on 12-11-10.
//  Copyright (c) 2012年 David. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userIsInTheMiddleOfCalculating;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize userIsInTheMiddleOfCalculating = _userIsInTheMiddleOfCalculating;
@synthesize brain = _brain;

- (CalculatorBrain *)brain {
    if (nil == _brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    NSLog(@"Digit Pressed: %@", digit);
    if(self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = ![@"0" isEqualToString:digit];
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self.brain pushOperand:self.display.text.doubleValue];
    if (self.userIsInTheMiddleOfCalculating) {
        double result = [self.brain performOperation];
        self.display.text = [NSString stringWithFormat:@"%g", result];
        [self.brain pushOperand:self.display.text.doubleValue];
    }
    [self.brain setOperator:sender.currentTitle];
    self.userIsInTheMiddleOfCalculating = YES;
}

- (IBAction)enterPressed {
    if (self.userIsInTheMiddleOfCalculating) {
        [self.brain pushOperand:self.display.text.doubleValue];
        double result = [self.brain performOperation];
        self.display.text = [NSString stringWithFormat:@"%g", result];
        self.userIsInTheMiddleOfCalculating = NO;
    }
}

- (IBAction)clearPressed {
    self.display.text = @"0";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self.brain clearOperandStack];
}

@end
