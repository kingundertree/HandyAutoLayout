//
//  UIView+HandyAutoLayout.m
//  ZhanYe
//
//  Created by casa on 14-8-25.
//  Copyright (c) 2014年 me.andpay. All rights reserved.
//

#import "UIView+AEBHandyAutoLayout.h"

@implementation UIView (AEBHandyAutoLayout)

- (NSLayoutConstraint *)constraintHeight:(CGFloat)height
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:height];
}

- (NSLayoutConstraint *)constraintWidth:(CGFloat)width
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0f constant:width];
}

- (NSLayoutConstraint *)constraintCenterXEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f];
}

- (NSLayoutConstraint *)constraintCenterYEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
}

- (NSLayoutConstraint *)constraintHeightEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
}

- (NSLayoutConstraint *)constraintWidthEqualToView:(UIView *)view
{
    return [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f];
}

- (NSArray *)constraintsTop:(CGFloat)top FromView:(UIView *)view
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-(top)-[selfView]" options:0 metrics:@{@"top":@(top)} views:NSDictionaryOfVariableBindings(view, selfView)];
}

- (NSArray *)constraintsBottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:[selfView]-(bottom)-[view]" options:0 metrics:@{@"bottom":@(bottom)} views:NSDictionaryOfVariableBindings(view, selfView)];
}

- (NSArray *)constraintsLeft:(CGFloat)left FromView:(UIView *)view
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:[selfView]-(left)-[view]" options:0 metrics:@{@"left":@(left)} views:NSDictionaryOfVariableBindings(view, selfView)];
}

- (NSArray *)constraintsRight:(CGFloat)right FromView:(UIView *)view
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-(right)-[selfView]" options:0 metrics:@{@"right":@(right)} views:NSDictionaryOfVariableBindings(view, selfView)];
}

- (NSArray *)constraintsSizeEqualToView:(UIView *)view
{
    return @[
        [self constraintHeightEqualToView:view],
        [self constraintWidthEqualToView:view]
    ];
}

- (NSArray *)constraintsSize:(CGSize)size
{
    return @[
        [self constraintHeight:size.height],
        [self constraintWidth:size.width]
    ];
}

- (NSArray *)constraintsFillWidth
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[selfView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(selfView)];
}

- (NSArray *)constraintsFillHeight
{
    UIView *selfView = self;
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[selfView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(selfView)];
}

- (NSArray *)constraintsFill
{
    NSMutableArray *resultConstraints = [[NSMutableArray alloc] initWithArray:[self constraintsFillWidth]];
    [resultConstraints addObjectsFromArray:[self constraintsFillHeight]];
    return [NSArray arrayWithArray:resultConstraints];
}

@end
