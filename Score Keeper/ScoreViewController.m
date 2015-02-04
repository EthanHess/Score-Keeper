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
    
    // Initializing scrollView as an instance of the UIScrollView object
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    // scrollView.tintColor = [UIColor redColor];
    
    // in the example of a picture frame, scrollView is the literally the frame of the picture. contentSize is the photo/painting.
    // if the contentSize is the same as the frame (scrollView), it has no need to move around to see the rest of the picture.
    // But, if the contentSize is bigger, then the frame has to move, hence, the screen will "bounce"/scroll up and down.
    // Rule of thumb: make contentSize height bigger than the frame (that is if you want it to scroll up and down
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 550);
    
    [self.view addSubview:scrollView];
    // Right before this, scrollView is nil. scrollView (or frame in the picture example), was made, but nothing was done with it.
    // By setting self.scrollView to scrollView (the frame we just made above), its saying to the @property in the header file, here is a frame that we'll use.
    self.scrollView = scrollView;

    self.title = @"Score Keeper";
    
    // This is essential, but even though it was a @property in h file, it wasn't initialized, hence the "new"
    self.scoreLabels = [NSMutableArray new];
    
    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];
    }

}

- (void)addScoreView: (NSInteger)index {
    
    CGFloat heightOfScoreBlock = 100;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, heightOfScoreBlock * index, self.view.frame.size.width, heightOfScoreBlock)];
    
    // Setting up all the Subviews for "view"
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(32, 8, 128, 64)];
    name.tag = 13; // <---- what does this do?
    name.delegate = self;
    name.placeholder = @"name";
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(135, 16, 50, 50)];
    [self.scoreLabels addObject:score];
    score.text = @"0";
    
    UIStepper *plusMinus = [[UIStepper alloc] initWithFrame:CGRectMake(195, 24, 0, 0)];
    plusMinus.minimumValue = 0;
    plusMinus.tag = index;
    plusMinus.maximumValue = 100;
    [plusMinus addTarget:self action:@selector(scoreStepperChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Adding all these set up Subviews to "view"
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:plusMinus];
    
    // Adds all "view" with the Subviews contained in them to scrollView's scrollView
    [self.scrollView addSubview: view];
    
}
    // So this essentially brings the whole [address of the] button into this method, it enters as "sender"
    // its an "id" because its willing to accept whatever typedef parameter, we just have to define it later.
- (void)scoreStepperChanged:(id)sender {
    
    // Just like this, since we know it came as a UIStepper, we have to essentially "redefine" it.
    // example: We want to send an PS4 to a friend. We go to a shop that packages in a cardboard box for you and sends it. You're friend receives it but doesn't know what
    // is inside of it (sender). He accepts it anyway not knowing (the 'id' part). Of course you do (you previously coded it as PS4), so you tell your friend,
    // "its a PS4 inside" (the "UIStepper *stepper = sender" part) Of course he can't force to recieve it as an XBox, but only as a PS4.
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = stepper.value;
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d", (int)value];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder]; // What does this actually do?
    return TRUE;
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
