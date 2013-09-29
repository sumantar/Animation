//
//  AnimatingTransitionDelegateClass.m
//  SampleViewControllerCustomTransition
//
//  Created by sumantar on 29/09/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "AnimatingTransitionDelegateClass.h"

//static NSTimeInterval const DETAnimatedTransitionDuration = 0.5f;
//static NSTimeInterval const DETAnimatedTransitionDurationForMarco = 0.15f;

static NSTimeInterval const TRANSITION_DURATION = 0.5f;

@implementation AnimatingTransitionDelegateClass

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
   
    UIView *container = [transitionContext containerView];
    
    if (self.reverse) {
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
    }
    else {
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        [container addSubview:toViewController.view];
    }
    
    [UIView animateKeyframesWithDuration:TRANSITION_DURATION delay:0 options:0 animations:^{
        if (self.reverse) {
            fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
        }
        else {
            toViewController.view.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return TRANSITION_DURATION;
}

@end
