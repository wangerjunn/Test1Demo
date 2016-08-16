//
//  CircleLayer.m
//  Test1Demo
//
//  Created by 花花 on 16/7/9.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "CircleLayer.h"

@interface CircleLayer ()


@property (nonatomic, strong) UIBezierPath *smallCirclePath;//小圆
@property (nonatomic, strong) UIBezierPath *bigCirclePath;//大圆
@property (nonatomic, strong) UIBezierPath *squichVeriCirclePath;//垂直挤压圆
@property (nonatomic, strong) UIBezierPath *squichHoriCirclePath;//水平挤压圆

@end

static const NSTimeInterval KAnimationDuration = 0.3;
static const NSTimeInterval KAnimationBeginTime = 0.0;

@implementation CircleLayer

- (instancetype)init {
    if (self = [super init]) {
        self.fillColor = [UIColor orangeColor].CGColor;
        self.path = self.smallCirclePath.CGPath;
    }
    
    return self;
}


- (UIBezierPath *)smallCirclePath {
    if (!_smallCirclePath) {
        _smallCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50.0, 50.0, 0.0, 0.0)];
    }
    
    return  _smallCirclePath;
}

- (UIBezierPath *)bigCirclePath {
    if (!_bigCirclePath) {
        _bigCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 2.5, 95.0, 95.0)];
    }
    
    return _bigCirclePath;
}

- (UIBezierPath *)squichVeriCirclePath {
    if (!_squichVeriCirclePath) {
        _squichVeriCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 5.0, 95.0, 90.0)];
    }
    
    return _squichVeriCirclePath;
}

- (UIBezierPath *)squichHoriCirclePath {
    if (!_squichHoriCirclePath) {
        _squichHoriCirclePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5.0, 2.5, 90.0, 95.0)];
    }
    
    return _squichHoriCirclePath;
}


- (void)wobbleAnimation {
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.bigCirclePath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.squichVeriCirclePath.CGPath);
    animation1.duration = KAnimationDuration;
    animation1.beginTime = KAnimationBeginTime;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(self.squichVeriCirclePath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(self.squichHoriCirclePath.CGPath);
    animation2.duration = KAnimationDuration;
    animation2.beginTime = animation1.beginTime + animation1.duration;
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id _Nullable)(self.squichHoriCirclePath.CGPath);
    animation3.toValue = (__bridge id _Nullable)(self.squichVeriCirclePath.CGPath);
    animation3.duration = KAnimationDuration;
    animation3.beginTime = animation2.beginTime + animation2.duration;
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation4.fromValue = (__bridge id _Nullable)(self.squichVeriCirclePath.CGPath);
    animation4.toValue = (__bridge id _Nullable)(self.bigCirclePath.CGPath);
    animation4.duration = KAnimationDuration;
    animation4.beginTime = animation3.beginTime + animation3.duration;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1,animation2,animation3,animation4];
    groupAnimation.duration = KAnimationDuration * 4;
    groupAnimation.repeatCount = 2;
    [self addAnimation:groupAnimation forKey:nil];
    
    
}

- (void)expand {
    
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.smallCirclePath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.bigCirclePath.CGPath);
    
    expandAnimation.duration = KAnimationDuration;
    
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    
    [self addAnimation:expandAnimation forKey:nil];
}

//收缩动画
- (void)contract {
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id _Nullable)(self.bigCirclePath.CGPath);
    expandAnimation.toValue = (__bridge id _Nullable)(self.smallCirclePath.CGPath);
    expandAnimation.duration = KAnimationDuration;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self addAnimation:expandAnimation forKey:nil];
}

@end
