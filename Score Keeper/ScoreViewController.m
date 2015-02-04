//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Ethan Hess on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    self.title = @"Score Keeper";
    self.scoreLabels = [NSMutableArray new];
    
    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];
    }

    
    
}

- (void)addScoreView: (NSInteger)index {
    
    CGFloat heightOfScoreBlock = 100;

    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, (index +1) * heightOfScoreBlock, self.view.frame.size.width, heightOfScoreBlock)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(32, 8, 128, 64)];
    name.placeholder = @"name";
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(135, 16, 50, 50)];
    score.text = @"0";
    
    UIStepper *plusMinus = [[UIStepper alloc] initWithFrame:CGRectMake(195, 24, 0, 0)];
    plusMinus.minimumValue = 0;
    plusMinus.tag = index;
    plusMinus.maximumValue = 100;
    [plusMinus addTarget:self action:@selector(scoreStepperChanged:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:plusMinus];
    
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:plusMinus];
    
    [self.view addSubview: view];
    
}

- (void)scoreStepperChanged:(id)sender {
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = stepper.value;
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d", (int)value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
