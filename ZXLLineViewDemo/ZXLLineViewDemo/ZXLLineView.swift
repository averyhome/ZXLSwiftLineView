//
//  ZXLLineView.swift
//  ZXLLineViewDemo
//
//  Created by zhusven on 15/8/18.
//  Copyright (c) 2015年 zhusven. All rights reserved.
//

import UIKit
@IBDesignable
class ZXLLineView: UIView {
    @IBInspectable  var topLine: Bool=false
    @IBInspectable  var leftLine: Bool=false
    @IBInspectable  var bottonLine: Bool=false
    @IBInspectable  var rightLine: Bool=false
    @IBInspectable  var lineWidth: CGFloat=2
    @IBInspectable  var lineColor: UIColor=UIColor.blackColor()

    

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if topLine{
            var fromPoint = CGPointMake(0, 0)
            var toPoint = CGPointMake(self.frame.size.width, 0)
            self.drawLineFromPoint(fromPoint,toPoint: toPoint)
        }
        if leftLine{
            var fromPoint = CGPointMake(0, 0)
            var toPoint = CGPointMake(0, self.frame.size.height)
            self.drawLineFromPoint(fromPoint, toPoint: toPoint)
        }
        if bottonLine{
            var fromPoint = CGPointMake(0,self.frame.size.height)
            var toPoint = CGPointMake(self.frame.size.width, self.frame.size.height)
            self.drawLineFromPoint(fromPoint, toPoint: toPoint)
        }
        if rightLine{
            var fromPoint = CGPointMake(self.frame.size.width, 0)
            var toPoint = CGPointMake(self.frame.size.width, self.frame.size.height)
            self.drawLineFromPoint(fromPoint, toPoint: toPoint)
        }
    }

    
    func drawLineFromPoint(fromPoint: CGPoint ,toPoint: CGPoint){
        
        var context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, lineColor.CGColor);//线条颜色
        CGContextSetLineWidth(context, lineWidth/2);//线条宽度
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y); //开始画线, x，y 为开始点的坐标
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y);//画直线, x，y 为线条结束点的坐标
        CGContextStrokePath(context); //开始画线
    }
}
