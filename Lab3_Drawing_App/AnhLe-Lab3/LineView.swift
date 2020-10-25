//
//  LineView.swift
//  AnhLe-Lab3
//
//  Created by Anh Le on 10/23/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    var theLine: Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var lines: [Line] = [] {
        didSet{
            setNeedsDisplay()
        }
    }
    
    func drawLine(_ line: Line){
        let path = createQuadPath(points: line.points)
        line.color.setFill()
        if(line.points.count == 1 || line.points.count == 2){
            path.addArc(withCenter: line.points[0], radius: line.width/2, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
            path.fill()
        }
        else{
            path.lineWidth = line.width
            line.color.setStroke()
            path.stroke()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        return CGPoint(x: (first.x + second.x)/2, y: (first.y + second.y)/2)
    }
    
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if(points.count < 2){
            return path
        }
        path.move(to: points[0])
        for i in 1..<points.count - 1 {
            let firstMidpoint = midpoint(first: path.currentPoint, second: points[i])
            let secondMidpoint = midpoint(first: points[i], second: points[i+1])
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint, controlPoint2: points[i])
        }
        return path
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        for line in lines{
            drawLine(line)
        }
        if(theLine != nil){
            drawLine(theLine!)
        }
    }
}
