//
//  Animator.swift
//  testProject
//
//  Created by Артем Оголец on 21.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            //            Артем, смотрите, sourceVC теперь не нужен, мы его не анимируем,
            //            у нас анимируется только появляющийся контроллер desinationVC
            //            let sourceVC = transitionContext.viewController(forKey: .from),
            let destinationVC = transitionContext.viewController(forKey: .to)
            else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        //        Соответственно, все эти вычисления нам тоже не нужны, мы их убираем
        
        //        let sourceVCTargetFrame = CGRect (x: containerViewFrame.width,
        //                                          y: 0,
        //                                          width: sourceVC.view.frame.width,
        //                                          height: sourceVC.view.frame.height)
        
        //        let destinationVCTargetFramge = sourceVC.view.frame
        
        transitionContext.containerView.addSubview(destinationVC.view)
        
        //        Что мы делаем, мы прикрепляем якорь в нашем слое
        //        в правый верхний угол (x: 1, y: 0),
        //        чтобы вид вращался относительно правого верхнего угла
        destinationVC.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        
        //        Итоговый фрейм у нас должен быть изначальным
        destinationVC.view.frame = containerViewFrame
        
        //        Затем нам нужно лишь повернуть наш фрейм против часовой по 90º
        destinationVC.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       animations: {
                        //                        Первая анимация нам не нужна, удаляем ее
                        
                        //                        sourceVC.view.frame = sourceVCTargetFrame
                        
                        //                        Вторая анимация это возврат к дотрансформированному значению
                        //                        для нашего вида это containerViewFrame
                        
                        destinationVC.view.transform = .identity
        }) {finished in
            //sourceVC.removeFromParent()
            transitionContext.completeTransition(finished)
        }
        
        
    }
    
}
