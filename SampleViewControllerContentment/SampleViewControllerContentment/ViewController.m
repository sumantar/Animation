//
//  ViewController.m
//  SampleViewControllerContentment
//
//  Created by sumantar on 29/09/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    UIViewController *_currentChildController;
}

@property (nonatomic, strong) FirstViewController *fvc;
@property (nonatomic, strong) SecondViewController *svc;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //First view controller
    _fvc = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [self addChildViewController:_fvc];
    [_fvc didMoveToParentViewController:self];
    
    //Second view controller
    _svc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self addChildViewController:_svc];
    [_svc didMoveToParentViewController:self];
    
    _currentChildController = _fvc;
    [self.view addSubview:_fvc.view];
    
    [self updateTitle:_fvc];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction) leftButtonSelected
{
    UIViewController *newChildController = nil;
    
    if ([_currentChildController isKindOfClass:[FirstViewController class]])
    {
        newChildController = _svc;
    }
    else if ([_currentChildController isKindOfClass:[SecondViewController class]])
    {
        newChildController = _fvc;
    }
    else
        NSAssert(FALSE, @"Unknown controller type");
    
    [self transitionFrom:_currentChildController To:newChildController];
}

- (void)transitionFrom:(UIViewController *)oldController To:(UIViewController *)newController
{
    if(oldController == newController)
        return;
    
    //This line is added for orientation
    [newController didMoveToParentViewController:self];
    
    //Move the view between te
    [self transitionFromViewController:oldController
                      toViewController:newController
                              duration:0.5
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                //Identify, the content to be changed with Animation
                                [self updateTitle:newController];
                            }
                            completion:^(BOOL finished){
                                _currentChildController = newController;
                            }];
}
/*
 
 UIViewAnimationOptionTransitionNone            = 0 << 20, // default
 UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
 UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
 UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
 UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
 UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
 UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
 UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
 */

- (void) updateTitle:(UIViewController *)ctrl
{
    if([ctrl isKindOfClass:[FirstViewController class]])
    {
        self.navigationItem.title = @"First View";
    }
    else if([ctrl isKindOfClass:[SecondViewController class]])
    {
        self.navigationItem.title = @"Second View";
    }
    else
    {
        self.navigationItem.title = @"Main View";
    }
}

- (BOOL)shouldAutomaticallyForwardRotationMethods{
    
    return YES;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods{
    
    return YES;
}

@end
