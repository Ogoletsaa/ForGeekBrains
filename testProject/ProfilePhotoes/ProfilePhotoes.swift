//
//  Details.swift
//  testProject
//
//  Created by Артем Оголец on 02.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class ProfilePhotoes: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var detailsView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!

    var menu: Menu?
    var deadpoolPhotoes: [String] = ["dp1","dp2","dp3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        pageControl.numberOfPages = deadpoolPhotoes.count
        
        for index in 0..<deadpoolPhotoes.count {
            let xPosition = view.frame.size.width * CGFloat(index)
            let imgView = UIImageView(frame: CGRect(x:xPosition,y: 0, width: self.view.frame.width, height: self.scrollView.frame.size.height))
            imgView.contentMode = .scaleAspectFill
            imgView.image = UIImage (named: self.deadpoolPhotoes[index])
            self.scrollView.addSubview(imgView)
        }
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(deadpoolPhotoes.count), height: scrollView.frame.size.height)
        self.scrollView.delegate = self
    }

    //ScrollView method
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    
    }
   
    @IBAction func pageChange(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.frame.size.width
        scrollView.contentOffset = CGPoint(x: x, y: 0)
    }
}

