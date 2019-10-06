//
//  CalaulatorViewController.m
//  calculator
//
//  Created by Jaya Shen on 2019/9/30.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "CalaulatorViewController.h"
#import "Masonry.h"

@interface CalaulatorViewController ()

@property NSInteger count;
@property int sumFlag;

@end

@implementation CalaulatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _calculatorview = [[CalculatorView alloc] init];
    [self.view addSubview:_calculatorview];
    [_calculatorview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    _str = [[NSMutableString alloc] init];
    
    _calculatorModel = [[CalculatorModel alloc] init];
    
    _calculatorModel.allArray = [[NSMutableArray alloc] init];
    _calculatorModel.tempArray = [[NSMutableArray alloc] init];
    
    _sumFlag = 0;
    
    
    [_calculatorview.acButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.leftButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.rightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.divisionButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.multiplyButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.subtractButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.addButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.summationButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.pointButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.oneButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.twoButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.threeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.fourButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.fiveButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.sixButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.sevenButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.eightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.nineButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_calculatorview.zeroButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    

}

-(void)click:(UIButton *)btn {
    if (_sumFlag != 0) {
        _calculatorModel.allArray[0] = [NSString stringWithFormat:@"%d",_sumFlag];
        _calculatorview.allString = _calculatorModel.allArray[0];
    }
    _calculatorview.allString = [_calculatorview.allString stringByAppendingString: btn.titleLabel.text];
    _calculatorview.strView.text = _calculatorview.allString;
    if ((btn.tag >= 0) && (btn.tag <= 10)) {
        NSString *str = btn.titleLabel.text;
        _calculatorview.numbleString = [_calculatorview.numbleString stringByAppendingString: str];
        if ([btn.titleLabel.text isEqualToString:@"."]) {
            _count++;
        }
    }
    if ((btn.tag >= 12) && (btn.tag < 18)) {
        if ([_calculatorview.numbleString length] != 0) {
            if (([_calculatorview.numbleString characterAtIndex:[_calculatorview.numbleString length] - 1] == '.') || ([_calculatorview.numbleString characterAtIndex:0] == '.') || (_count > 1)){
                _count = 0;
                [self error];
            } else {
                [_calculatorModel PushInto: _calculatorview.numbleString];
                _calculatorview.numbleString = @"";
                _count = 0;
            }
        }
        if ([_calculatorModel.tempArray count] == 0) {
            if ([btn.titleLabel.text isEqualToString:@")"]) {
                [self error];
            } else {
                [_calculatorModel tempPushIntoSymbol:btn.titleLabel.text];
            }
        } else {
            if ([_calculatorModel Compare:btn.titleLabel.text] == 0) {
                if ([btn.titleLabel.text isEqualToString: @"("]) {
                    [_calculatorModel tempPushIntoSymbol: btn.titleLabel.text];
                } else {
                    [_calculatorModel PushInto:@"nil"];
                    [_calculatorModel tempPushIntoSymbol:btn.titleLabel.text];
                }
            } else {
                if ([btn.titleLabel.text isEqualToString:@")"]) {
                    for (int i = (int)[_calculatorModel.tempArray count] - 1; ; i--){
                        
                        if ([_calculatorModel.tempArray[i] isEqualToString:@"("]) {
                            while (1) {
                                if ([_calculatorModel.tempArray count] == i + 1) {
                                    break;
                                }
                                [_calculatorModel.allArray addObject:_calculatorModel.tempArray[i + 1]];
                                [_calculatorModel.tempArray removeObjectAtIndex:i + 1];
                            }
                            [_calculatorModel.tempArray removeObjectAtIndex:i];
                            break;
                        }
                        if (i == 0) {
                            [self error];
                            break;
                        }
                    }
                } else {
                    [_calculatorModel tempPushIntoSymbol:btn.titleLabel.text];
                }
            }
        }
    }
    if (btn.tag == 11) {
        [_calculatorModel.tempArray removeAllObjects];
        [_calculatorModel.allArray removeAllObjects];
        _calculatorview.numbleString = @"";
        _calculatorview.strView.text = @"0";
        _calculatorview.allString = @"";
        _sumFlag = 0;
    }
    if (btn.tag == 100) {
        if ([_calculatorview.numbleString length] != 0) {
            [_calculatorModel PushInto:_calculatorview.numbleString];
        }
        while ([_calculatorModel.tempArray count] != 0) {
            [_calculatorModel PushInto:@"nil"];
        }
        while (1) {
            NSInteger flag = 0;
            for (int i = 0; i < [_calculatorModel.allArray count]; i++) {
                if (([_calculatorModel.allArray[i] isEqualToString:@"+"]) || ([_calculatorModel.allArray[i] isEqualToString:@"-"]) || ([_calculatorModel.allArray[i] isEqualToString:@"*"]) || ([_calculatorModel.allArray[i] isEqualToString:@"/"])){
                    if (i <= 1) {
                        [self error];
                        flag = 1;
                        break;
                    } else {
                        float number1 = [_calculatorModel Transform:_calculatorModel.allArray[i - 2]];
                        float number2 = [_calculatorModel Transform:_calculatorModel.allArray[i - 1]];
                        if ([_calculatorModel.allArray[i] isEqualToString:@"+"]) {
                            _calculatorModel.allArray[i] = [NSString stringWithFormat: @"%f", number1 + number2];
                        }
                        if ([_calculatorModel.allArray[i] isEqualToString:@"-"]) {
                            _calculatorModel.allArray[i] = [NSString stringWithFormat: @"%f", number1 - number2];
                        }
                        if ([_calculatorModel.allArray[i] isEqualToString:@"*"]) {
                            _calculatorModel.allArray[i] = [NSString stringWithFormat: @"%f", number1 * number2];
                        }
                        if ([_calculatorModel.allArray[i] isEqualToString:@"/"]) {
                            _calculatorModel.allArray[i] = [NSString stringWithFormat: @"%f", number1 / number2];
                        }
                        [_calculatorModel.allArray removeObjectAtIndex: i - 1];
                        [_calculatorModel.allArray removeObjectAtIndex: i - 2];
                        break;
                    }
                    
                }
                if (i == [_calculatorModel.allArray count] - 1) {
                    if ([_calculatorModel.allArray count] == 1) {
                        break;
                    } else {
                        [self error];
                        flag = 1;
                    }
                }
            }
            if (flag == 1) {
                break;
            }
            if ([_calculatorModel.allArray count] == 1) {
                _sumFlag = [_calculatorModel.allArray[0] intValue];
                _calculatorview.strView.text = _calculatorModel.allArray[0];
                [_calculatorModel.tempArray removeAllObjects];
                [_calculatorModel.allArray removeAllObjects];
                _calculatorview.numbleString = @"";
                _calculatorview.allString = @"";
                break;
            }
        }
    }
    NSLog(@"tmepArray = %@, allArray = %@, numberStr = %@", _calculatorModel.tempArray, _calculatorModel.allArray, _calculatorview.numbleString);
}

- (void)error {
    [_calculatorModel.tempArray removeAllObjects];
    [_calculatorModel.allArray removeAllObjects];
    _calculatorview.numbleString = @"";
    _calculatorview.strView.text = @"出错";
    _calculatorview.allString = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
