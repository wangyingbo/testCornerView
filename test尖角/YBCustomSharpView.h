//
//  customSharpView.h
//  test尖角
//
//  Created by 王迎博 on 16/2/18.
//  Copyright © 2016年 王迎博. All rights reserved.

#import <UIKit/UIKit.h>

@interface YBCustomSharpView : UIView
{
    UIBezierPath *path;//用于绘制图的path
    CGPoint _point;//尖角指向的点
    CGFloat _cornerH;//尖角的高
    CGFloat _viewW;//view的宽
    CGFloat _viewH;//view的高
}


/**
 *  自定义带尖角的view
 *
 *  @param point   尖角指向的点
 *  @param cornerH 尖角的高
 *  @param viewW   view的宽
 *  @param viewH   view的高
 *
 *  @return 返回一个定义好的view
 */
- (id)initSharpView:(CGPoint)point WithCornerH:(CGFloat)cornerH WithViewW:(CGFloat)viewW WithViewH:(CGFloat)viewH;


/**
 *  <#Description#>
 *
 *  @param color   view颜色
 *  @param alpha   透明度
 *  @param cornerW 尖角的宽
 */
- (void)draw:(UIColor *)color viewAlpha:(CGFloat)alpha cornerrW:(CGFloat)cornerrW;

@end
