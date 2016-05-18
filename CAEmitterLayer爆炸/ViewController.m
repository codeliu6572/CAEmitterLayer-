//
//  ViewController.m
//  CAEmitterLayer爆炸
//
//  Created by 刘浩浩 on 16/5/18.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];
    //configure emitter    kCAEmitterLayerAdditive合并重叠部位的亮度，使之更亮
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"fire.png"].CGImage;
    //加速或者扩大整个粒子系统
    cell.birthRate = 150;
    //存在时间
    cell.lifetime = 5.0;
    //混合图片内容颜色的混合色
    cell.color = [UIColor colorWithRed:0.98f green:0.54f blue:0.14f alpha:1.00f].CGColor;
    //每秒钟透明度变化
    cell.alphaSpeed = -0.4;
    //控制粒子辐射的速度
    cell.velocity = 100;
    //粒子辐射速度的范围，像是一个最大速度
    cell.velocityRange = 100;
    //辐射角度
    cell.emissionRange = M_PI * 2.0;
    //add particle template to emitter
    emitter.emitterCells = @[cell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
