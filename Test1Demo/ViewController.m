//
//  ViewController.m
//  Test1Demo
//
//  Created by 花花 on 16/6/21.
//  Copyright © 2016年 花花. All rights reserved.
//

#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "AnimationDemoView.h"

@interface ViewController () //<CAAnimationDelegate>
{
    UIImageView *img_circle;//圆
    CGFloat circleWidth;
    
    //圆进度
    CAShapeLayer *_circleShapeLayer;//进度
    NSTimer *_timer;
    CGFloat _progress;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    //进度
//    [self initCircleProgressUI];
    self.view.backgroundColor = [UIColor whiteColor];
    //启动动画
    [self initAnimationUI];
}

//初始化进度条UI
- (void)initCircleProgressUI {
    
    //贝塞尔曲线
//    UIBezierPath *bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    _progress = .0;
    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:CGPointMake(kSCREEN_WIDTH/2.0, kSCREEN_HEIGHT/2.0) radius:100 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    _circleShapeLayer = [CAShapeLayer layer];
    _circleShapeLayer.frame = CGRectMake(0, 0, 200, 200);
    _circleShapeLayer.fillColor = [UIColor greenColor].CGColor;
    _circleShapeLayer.strokeStart = 0.0;
    _circleShapeLayer.strokeEnd = _progress;
    _circleShapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    _circleShapeLayer.lineWidth = 2.0;

    _circleShapeLayer.path = bezier.CGPath;
//    _circleShapeLayer.position = self.view.center;
    
    [self.view.layer addSublayer:_circleShapeLayer];
    
    [_circleShapeLayer setStrokeEnd:0];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    
}

- (void)changeProgress {
    
    
    if (_progress < 0.8) {
        _progress += .025;
        _circleShapeLayer.strokeEnd = _progress;
    }else{
        [_timer invalidate];
        _timer = nil;
    }
    NSLog(@"strokeEnd = %f",_circleShapeLayer.strokeEnd);
}

//初始化启动动画UI
- (void)initAnimationUI {
    
    CGFloat size = 100;
    //
    AnimationDemoView *animationDemoView = [[AnimationDemoView alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2.0-size/2.0,kSCREEN_HEIGHT/2.0-size/2.0,size,size)];
    animationDemoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:animationDemoView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
