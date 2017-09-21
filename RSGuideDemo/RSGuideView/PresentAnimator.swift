//
//  PresentAnimator.swift
//  RSGuideDemo
//
//  Created by WhatsXie on 2017/9/21.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    let duration = 0.4 //动画的时间
    var originFrame = CGRect.zero //点击Cell的frame
    var originVc:UIViewController?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containView = transitionContext.containerView
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        let finalFrame = toView.frame
        toView.frame.origin.x = originFrame.size.width
        containView.addSubview(toView)
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.originVc?.view.frame.origin.x -= finalFrame.size.width
            toView.frame.origin.x = 0
        }) { (finished) -> Void in
            transitionContext.completeTransition(true)
        }
    }
}
