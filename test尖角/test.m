//
//  test.m
//  test尖角
//
//  Created by 王迎博 on 16/2/5.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "test.h"
#define ORC_RADIUS 8

@implementation test
@synthesize title;

/**
 *  重写init方法
 *
 *  @param p   尖角指向的点
 *  @param str label上显示的字
 *
 *  @return 返回一个自定义的带尖角的view，上面有label
 */
-(id) init:(CGPoint) p str:(NSString*) str
{
    if([super init] == nil)
        return nil;
    path = [[UIBezierPath alloc] init];
    
    
    label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [label setBackgroundColor: [UIColor clearColor]];
    font = [UIFont systemFontOfSize:18.0];
    label.font = font;
    label.layer.borderWidth = 1;
    label.layer.borderColor = [[UIColor whiteColor] CGColor];
    label.layer.cornerRadius = 5;
    
    
    
    [self setBackgroundColor: [UIColor clearColor]];
    [self setAlpha:0.5];
    [self addSubview: label];
    [self set_point: p];
    [self set_title: str];

    

    
    
    return (self);
}


/**
 *  <#Description#>
 */
-(void)reloadData
{
    [self setNeedsDisplay];
}


/**
 *  设置尖角指向的点
 */
-(void)set_point:(CGPoint)p
{
    point = p;
}


/**
 *  设置填充颜色
 */
- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] setFill];
    [path fill];
}


/**
 *  给label设置内容
 *
 *  @param str 传入的字符串。
 */
-(void) set_title:(NSString*) str
{
    label.text = str;
    
    size = CGSizeMake(90, 30);
    label.frame = CGRectMake(30-ORC_RADIUS, 10, size.width, size.height);//设置label的大小
    
    size.height += 30;//60
    size.width += 60;//150
    double x = point.x - size.width;
    double y = point.y - size.height/2;
    origin.x = x;
    origin.y = y;
    
    
    self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);//设置自身view的大小
//    self.backgroundColor = [UIColor lightGrayColor];
    [self set_path];
}


/**
 *  绘制曲线
 */
-(void)set_path
{
//    NSLog(@"bounds %@", NSStringFromCGRect(self.bounds));
//    NSLog(@"size %@", NSStringFromCGSize(size));
    double h = size.height - ORC_RADIUS*3;
    CGPoint p = CGPointMake(0, 0);
    NSLog(@"1 start point %@", NSStringFromCGPoint(p));
    
    [path moveToPoint:p];//开始的点
    p.x += size.width - ORC_RADIUS*2;
//    NSLog(@"2 middle point %@", NSStringFromCGPoint(p));
    
    [path addLineToPoint: p];//第一条线
    p.y += ORC_RADIUS;
//    NSLog(@"3 middle point %@", NSStringFromCGPoint(p));
    p.y += h/2;
    [path addLineToPoint: p];//第二条线
    p.x += ORC_RADIUS*2;
    p.y +=4;//指向的长度4
    [path addLineToPoint: p];//第三条线
    p.x -= ORC_RADIUS*2;
    p.y +=4;
    [path addLineToPoint: p];//第四条线
    p.y += h/2;
    [path addLineToPoint: p];//第五条线
    p.x -= size.width;
    [path addLineToPoint: p];//第六条线
    p.y -=h;
    [path addLineToPoint: p];//第七条线
    
    [path closePath];
}






@end
