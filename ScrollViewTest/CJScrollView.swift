//
//  CJScrollView.swift
//  ScrollViewTest
//
//  Created by Jian Jian on 2018/9/9.
//  Copyright © 2018年 CJ. All rights reserved.
//

import UIKit

class CJScrollView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureAction(pan:)))
        self.addGestureRecognizer(panGesture)
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var contentSize:CGSize = CGSize.zero
    var contentOffset:CGPoint = CGPoint.zero{
        didSet{
            var newBounds = self.bounds
            newBounds.origin = contentOffset
            self.bounds = newBounds
        }
    }
    //
    var startLocation:CGPoint = CGPoint.zero
    
}
extension CJScrollView{
    @objc func panGestureAction(pan:UIPanGestureRecognizer){
        if pan.state == .began{
            startLocation = self.bounds.origin
            NSLog("\(startLocation)")
        }
        if pan.state == .changed{
            let point = pan.translation(in: self)
            NSLog("\(point)")
            var newOriginX = self.startLocation.x - point.x
            var newOriginY = self.startLocation.y - point.y
            
            
            //
            if newOriginX < 0{
                newOriginX = 0
            }else{
                let maxMoveWidth = contentSize.width - self.bounds.width
                if newOriginX > maxMoveWidth{
                    newOriginX = maxMoveWidth
                }
            }
            if newOriginY < 0{
                newOriginY = 0
            }else{
                let maxMoveHeight = contentSize.height - self.bounds.height
                if newOriginY > maxMoveHeight{
                    newOriginY = maxMoveHeight
                }
            }
            var bounds = self.bounds
            bounds.origin = CGPoint.init(x:newOriginX, y:newOriginY)
            self.bounds = bounds
            
        }
        // 相对于初始触摸点的偏移量
    }
}

