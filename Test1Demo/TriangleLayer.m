//
//  TriangleLayer.m
//  Test1Demo
//
//  Created by 花花 on 16/7/12.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "TriangleLayer.h"

@interface TriangleLayer ()

@property (nonatomic, strong) UIBezierPath *smallTrianglePath;
@property (nonatomic, strong) UIBezierPath *leftTrianglePath;
@property (nonatomic, strong) UIBezierPath *rightTrianglePath;
@property (nonatomic, strong) UIBezierPath *topTrianglePath;

@end

@implementation TriangleLayer
static const NSTimeInterval KAnimationDuration = 0.3;
static const NSTimeInterval KAnimationBeginTime = 0.0;

- (id)init {
    if (self = [super init]) {
        
        self.path = self.smallTrianglePath.CGPath;
        self.fillColor = [UIColor orangeColor].CGColor;
        self.lineCap = kCALineCapRound;
        self.lineWidth = 7.0;
        self.lineJoin = kCALineJoinRound;
        self.strokeColor = [UIColor orangeColor].CGColor;
    }
    
    return self;
}

- (UIBezierPath *)smallTrianglePath {
    if (!_smallTrianglePath) {
        _smallTrianglePath = [UIBezierPath bezierPath];
        [_smallTrianglePath moveToPoint:CGPointMake(50, 10)];
        [_smallTrianglePath addLineToPoint:CGPointMake(20, 80)];
        [_smallTrianglePath addLineToPoint:CGPointMake(75, 80)];
        [_smallTrianglePath closePath];
    }
    
    return _smallTrianglePath;
}


- (UIBezierPath *)leftTrianglePath {
    if (!_leftTrianglePath) {
        _leftTrianglePath = [UIBezierPath bezierPath];
        [_leftTrianglePath moveToPoint:CGPointMake(50, 10)];
        [_leftTrianglePath addLineToPoint:CGPointMake(5, 80)];
        [_leftTrianglePath addLineToPoint:CGPointMake(90, 80)];
        [_leftTrianglePath closePath];
    }
    
    return _leftTrianglePath;
}


- (UIBezierPath *)rightTrianglePath {
    if (!_rightTrianglePath) {
        _rightTrianglePath = [UIBezierPath bezierPath];
        [_rightTrianglePath moveToPoint:CGPointMake(50, 10)];
        [_rightTrianglePath addLineToPoint:CGPointMake(5, 80)];
        [_rightTrianglePath addLineToPoint:CGPointMake(95, 80)];
        [_rightTrianglePath closePath];
    }
    
    return _rightTrianglePath;
}


- (UIBezierPath *)topTrianglePath {
    if (!_topTrianglePath) {
        _topTrianglePath = [UIBezierPath bezierPath];
        [_topTrianglePath moveToPoint:CGPointMake(50, 0)];
        [_topTrianglePath addLineToPoint:CGPointMake(5, 80)];
        [_topTrianglePath addLineToPoint:CGPointMake(95, 80)];
        [_topTrianglePath closePath];
    }
    
    return _topTrianglePath;
}

- (void)triangleAnimation {
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.smallTrianglePath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    animation1.beginTime = KAnimationBeginTime;
    animation1.duration = KAnimationDuration;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(self.leftTrianglePath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    animation2.beginTime = animation1.beginTime + animation1.duration;
    animation2.duration = KAnimationDuration;
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation3.fromValue = (__bridge id _Nullable)(self.rightTrianglePath.CGPath);
    animation3.toValue = (__bridge id _Nullable)(self.topTrianglePath.CGPath);
    animation3.beginTime = animation2.beginTime + animation2.duration;
    animation3.duration = KAnimationDuration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation1,animation2,animation3];
    group.duration = KAnimationDuration * group.animations.count;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [self addAnimation:group forKey:nil];
}

@end
