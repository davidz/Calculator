//
//  CalculatorBrain.h
//  Calculator
//
//  Created by inoyucom on 12-11-10.
//  Copyright (c) 2012年 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (void)clearOperandStack;
- (double)performOperation;
- (void)setOperator:(NSString *)operator;

@property (readonly) id program;

@end
