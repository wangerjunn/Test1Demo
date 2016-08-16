//
//  CircleLayer.h
//  Test1Demo
//
//  Created by 花花 on 16/7/9.
//  Copyright © 2016年 花花. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CircleLayer : CAShapeLayer

- (void)wobbleAnimation;

- (void)expand;

//吸收
- (void)contract;

@end
