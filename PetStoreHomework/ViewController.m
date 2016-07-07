//
//  ViewController.m
//  PetStoreHomework
//
//  Created by Efrain Ayllon on 7/6/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    StepperView *stepperView = [[StepperView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    
    stepperView.center = self.view.center;
    self.view.backgroundColor = [UIColor flatYellowColor];
    [self.view addSubview:stepperView];
    
    stepperView.delegate = self;
    
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 315, 100, 100)];
    [self.valueLabel setTextColor:[UIColor whiteColor]];
    self.valueLabel.text = [NSString stringWithFormat:@"0"];
    _valueLabel.font = [UIFont systemFontOfSize:25];

    [self.view addSubview:self.valueLabel];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
    
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)stepperView:(StepperView *)stepperView valueChanged:(NSInteger)value {
    self.valueLabel.text = [NSString stringWithFormat:@"%ld", (long)value];
}
@end
