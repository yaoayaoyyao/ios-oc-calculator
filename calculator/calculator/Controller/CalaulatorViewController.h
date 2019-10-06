//
//  CalaulatorViewController.h
//  calculator
//
//  Created by Jaya Shen on 2019/9/30.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorView.h"
#import "CalculatorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalaulatorViewController : UIViewController

@property (nonatomic, strong) CalculatorView *calculatorview;
@property (nonatomic, strong) CalculatorModel *calculatorModel;
@property (nonatomic, strong) NSMutableString *str;

@end

NS_ASSUME_NONNULL_END
