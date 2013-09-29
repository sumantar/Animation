//
//  ViewController.m
//  SampleViewControllerCustomTransition
//
//  Created by sumantar on 29/09/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ModalViewController *modalCtrl = ( ModalViewController *) segue.destinationViewController;
    modalCtrl.transitioningDelegate = self.transitioningDelegate;
}

@end
