//
//  CalculatorBrain.m
//  Calculator
//
//  Created by inoyucom on 12-11-10.
//  Copyright (c) 2012年 David. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;
@property (nonatomic, strong) NSString *operator;

@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;
@synthesize operator = _operator;

- (NSMutableArray *)operandStack {
    if(nil == _operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void)setOperator:(NSString *)operator {
    _operator = operator;
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (void)clearOperandStack {
    [self.operandStack removeAllObjects];
}

- (double) popOperand {
    NSNumber *operandNum = [self.operandStack lastObject];
    if(operandNum) [self.operandStack removeLastObject];
    return operandNum.doubleValue;
}

- (double)performOperation {
    double result = 0;
    double right = [self popOperand];
    double left = [self popOperand];
    if ([@"+" isEqualToString:self.operator]) {
        result = left + right;
    } else if ([@"-" isEqualToString:self.operator]) {
        result = left - right;
    } else if ([@"*" isEqualToString:self.operator]) {
        result = left * right;
    } else if ([@"/" isEqualToString:self.operator]) {
        result = left / right;
    }
    return result;
}


@end
