//
//  CalculatorView.h
//  calculator
//
//  Created by Jaya Shen on 2019/9/30.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorView : UIView

@property (nonatomic, strong) UITextView *strView;
@property (nonatomic, strong) UIButton *acButton;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *divisionButton; //除法
@property (nonatomic, strong) UIButton *multiplyButton; //乘法
@property (nonatomic, strong) UIButton *subtractButton; //减法
@property (nonatomic, strong) UIButton *addButton; //加法
@property (nonatomic, strong) UIButton *summationButton; //等于
@property (nonatomic, strong) UIButton *pointButton; //点
@property (nonatomic, strong) UIButton *oneButton;
@property (nonatomic, strong) UIButton *twoButton;
@property (nonatomic, strong) UIButton *threeButton;
@property (nonatomic, strong) UIButton *fourButton;
@property (nonatomic, strong) UIButton *fiveButton;
@property (nonatomic, strong) UIButton *sixButton;
@property (nonatomic, strong) UIButton *sevenButton;
@property (nonatomic, strong) UIButton *eightButton;
@property (nonatomic, strong) UIButton *nineButton;
@property (nonatomic, strong) UIButton *zeroButton;
@property NSString *allString;
@property NSString *numbleString;


@end

NS_ASSUME_NONNULL_END
