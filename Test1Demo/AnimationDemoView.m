
//
//  AnimationDemoView.m
//  Test1Demo
//
//  Created by 花花 on 16/7/9.
//  Copyright © 2016年 花花. All rights reserved.
//

#import "AnimationDemoView.h"
#import "CircleLayer.h"
#import "TriangleLayer.h"

@interface AnimationDemoView ()

@property (strong, nonatomic) CircleLayer *circleLayer;//圆
@property (strong, nonatomic) TriangleLayer *triangleLayer;//三角形

@end

@implementation AnimationDemoView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addCircle];
//        [self addTriangle];
    }
    
    return self;
}

- (CircleLayer *)circleLayer {
    if (_circleLayer == nil) {
        _circleLayer = [[CircleLayer alloc]init];
    }
    
    return _circleLayer;
}

- (TriangleLayer *)triangleLayer {
    if (!_triangleLayer) {
        _triangleLayer = [[TriangleLayer alloc]init];
    }
    
    return _triangleLayer;
}


#pragma mark -- 圆
- (void)addCircle{
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer expand];
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(showWobbleAnimation) userInfo:nil repeats:NO];
    
}

- (void)showWobbleAnimation {
    [self.circleLayer wobbleAnimation];
    [self.layer addSublayer:self.triangleLayer];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(showTriangleAnimation) userInfo:nil repeats:NO];
    
}

#pragma mark -- 三角形
- (void)showTriangleAnimation {
    [self.triangleLayer triangleAnimation];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(rotationAnimation) userInfo:nil repeats:NO];
}

- (void)rotationAnimation {
    
    [self transformRotationZ];
    [self.circleLayer contract];
}

- (void)transformRotationZ {
    self.layer.anchorPoint = CGPointMake(.5, .5);
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = @(M_PI*2);
    rotationAnimation.duration = .45;
    [self.layer addAnimation:rotationAnimation forKey:nil];
}

@end
