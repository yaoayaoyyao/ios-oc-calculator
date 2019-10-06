//
//  CalculatorModel.h
//  calculator
//
//  Created by Jaya Shen on 2019/9/30.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorModel : NSObject

@property NSMutableArray *tempArray;
@property NSMutableArray *allArray;

- (void)tempPushIntoSymbol: (NSString*)symbol;
- (void)tempPushOffSymbol: (NSString*)symbol;
- (void)PushInto: (NSString*)str;
- (NSInteger)Compare: (NSString*)str;
- (float)Transform: (NSString*)str;

@end

NS_ASSUME_NONNULL_END
