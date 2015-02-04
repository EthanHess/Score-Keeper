//
//  ScoreViewController.h
//  Score Keeper
//
//  Created by Ethan Hess on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController <UITextFieldDelegate>

// Property of scrollView gets instantiated in the m file.
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) NSMutableArray *scoreLabels;

@end
