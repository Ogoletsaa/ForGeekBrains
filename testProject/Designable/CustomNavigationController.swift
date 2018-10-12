//
//  CustomNavigationController.swift
//  testProject
//
//  Created by Артем Оголец on 21.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    class CustomIntaractiveTransition: UIPercentDrivenInteractiveTransition {
        
        var hasStarted = false
        var shouldFinish = false
    }
    
    let transitionAnimator = Animator()
    let intaractiveTransition = CustomIntaractiveTransition()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        let edgeSwipeGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handScreenEdgeGesture(_:)))
        edgeSwipeGR.edges = .left
        view.addGestureRecognizer(edgeSwipeGR)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return transitionAnimator
        } else if operation == .pop {
            return transitionAnimator
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return intaractiveTransition.hasStarted ? intaractiveTransition : nil
    }
    
    @objc func handScreenEdgeGesture(_ recogniser: UIScreenEdgePanGestureRecognizer) {
        switch recogniser.state {
        case .began:
            intaractiveTransition.hasStarted = true
            self.popViewController(animated: true)
        case .changed:
            let translation = recogniser.translation(in: recogniser.view)
            let relativeTranslation = translation.x / (recogniser.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTranslation))
            
            intaractiveTransition.shouldFinish = progress > 0.5
            
            intaractiveTransition.update(progress)
        case .ended:
            intaractiveTransition.hasStarted = false
            intaractiveTransition.shouldFinish ? intaractiveTransition.finish() : intaractiveTransition.cancel()
        case .cancelled:
            intaractiveTransition.hasStarted = false
            intaractiveTransition.cancel()
        default:
            break
        }
    }
}
