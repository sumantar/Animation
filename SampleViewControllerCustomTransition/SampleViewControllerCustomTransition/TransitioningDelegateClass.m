//
//  TransitioningDelegateClass.m
//  SampleViewControllerCustomTransition
//
//  Created by sumantar on 29/09/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "TransitioningDelegateClass.h"
#import "AnimatingTransitionDelegateClass.h"

@implementation TransitioningDelegateClass

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AnimatingTransitionDelegateClass *transitioningObj = [[AnimatingTransitionDelegateClass alloc] init];
    return transitioningObj;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AnimatingTransitionDelegateClass *transitioningObj = [[AnimatingTransitionDelegateClass alloc] init];
    transitioningObj.reverse = YES;
    return transitioningObj;
}

@end
