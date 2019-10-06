//
//  CalculatorModel.m
//  calculator
//
//  Created by Jaya Shen on 2019/9/30.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

- (void)tempPushIntoSymbol:(NSString *)symbol {
    [_tempArray addObject:symbol];
}
- (void)tempPushOffSymbol:(NSString *)symbol {
    [_tempArray removeObjectAtIndex:([_tempArray count] - 1)];
}
- (void)PushInto:(NSString *)str {
    if (([str isEqualToString:@"("]) || ([str isEqualToString:@")"])) {
        return;
    }
    if ([str isEqualToString:@"nil"]) {
        [_allArray addObject:_tempArray[[_tempArray count] - 1]];
        [_tempArray removeObjectAtIndex:([_tempArray count] - 1)];
    } else {
        [_allArray addObject:str];
    }
}
- (NSInteger)Compare:(NSString *)str {
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"(", @"+", @"-", @"*", @"/", @")", nil];
    for (int i = 0; i < [array count]; i++) {
        if ([_tempArray[[_tempArray count] - 1] isEqualToString:array[i]]) {
            return 1;            /*直接进栈*/
        }
        if ([str isEqualToString:array[i]]) {
            return 0;             /*操作*/
        }
    }
    return 0;
}
- (float)Transform:(NSMutableString *)str {
    int flag = 0;
    float sum = 0, temp = 0, t = 0.0;
    temp = (int)[str characterAtIndex:0] - 48;
    if ([str length] > 1) {
        for (int i = 1; i < [str length]; i++) {
            if ([str characterAtIndex:i] == '.') {
                sum += temp;
                temp = 0.1 * ((int)[str characterAtIndex:++i] - 48);
                t = 0.01;
                flag = 1;
                continue;
            } else {
                if (flag == 0) {
                    temp = temp * 10 + (int)[str characterAtIndex:i] - 48;
                } else {
                    temp = temp + t * ((int)[str characterAtIndex:i] - 48);
                    t = 0.1 * t;
                }
            }
        }
        sum += temp;
    } else {
        sum = (int)[str characterAtIndex:0] - 48;
    }
    return sum;
}


@end
