//
//  customSharpView.m
//  test尖角
//
//  Created by 王迎博 on 16/2/18.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "YBCustomSharpView.h"

#define cornerW                 15       //尖角的宽
#define sharpViewColor [UIColor blackColor]//自定义view的颜色
#define sharpViewAlpha          0.5      //自定义view的透明度


@implementation YBCustomSharpView

- (id)initSharpView:(CGPoint)point WithCornerH:(CGFloat)cornerH WithViewW:(CGFloat)viewW WithViewH:(CGFloat)viewH
{
    if (self = [super init])
    {
        path = [[UIBezierPath alloc] init];
        _cornerH = cornerH;
        _point = point;
        _viewH = viewH;
        _viewW = viewW;
        
        [self setFrame:CGRectMake(_point.x-_viewW/2, _point.y, _viewW, _viewH)];
//        self.backgroundColor = [UIColor lightGrayColor];
        [self setBackgroundColor: [UIColor clearColor]];
        
        [self set_Path];
    }
    
    return (self);
}



- (void)set_Path
{
    CGPoint p1 = CGPointMake(0, _cornerH);
    [path moveToPoint:p1];//开始的点
    
    CGPoint p2 = CGPointMake(_viewW/2-cornerW/2, _cornerH);
    [path addLineToPoint:p2];//第一条线
    
    CGPoint p3 = CGPointMake(_viewW/2, 0);
    [path addLineToPoint:p3];//第二条线
    
    CGPoint p4 = CGPointMake(_viewW/2+cornerW/2, _cornerH);
    [path addLineToPoint:p4];//第三条线
    
    CGPoint p5 = CGPointMake(_viewW, _cornerH);
    [path addLineToPoint:p5];//第四条线
    
    CGPoint p6 = CGPointMake(_viewW, _viewH);
    [path addLineToPoint:p6];//第五条线
    
    CGPoint p7 = CGPointMake(0, _viewH);
    [path addLineToPoint:p7];//第六条线
    
    [path addLineToPoint:p1];//第七条线
    
    [path closePath];
    
}
/**
 *  设置填充颜色
 */
- (void)drawRect:(CGRect)rect {
    [sharpViewColor setFill];
    self.alpha = sharpViewAlpha;
    [path fill];
}



- (void)draw:(UIColor *)color viewAlpha:(CGFloat)alpha cornerrW:(CGFloat)cornerrW
{

}


@end
