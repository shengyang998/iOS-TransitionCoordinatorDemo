//
//  ViewController.swift
//  TransitionCoordinator
//
//  Created by Soleil Yu on 2019/3/31.
//  Copyright © 2019 Soleil Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pushBtn = UIButton(type: .system)
    let progress = UIProgressView()
    
    let toColor = UIColor.random

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup button
        pushBtn.setTitle("push", for: .normal)
        pushBtn.setTitle("pushing", for: .highlighted)
        pushBtn.bounds = CGRect(x: 0, y: 0, width: view.bounds.width - 264, height: pushBtn.intrinsicContentSize.height + 22)
        pushBtn.layer.cornerRadius = pushBtn.bounds.height * 0.309
        pushBtn.layer.masksToBounds = true
        pushBtn.tintColor = UIColor.randomLight()
        pushBtn.backgroundColor = UIColor.randomDark()
        pushBtn.center = view.center
        pushBtn.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)

        view.addSubview(pushBtn)
        
        // setup progress
        progress.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: progress.intrinsicContentSize.height)
        progress.center = CGPoint(x: pushBtn.center.x, y: pushBtn.center.y - pushBtn.intrinsicContentSize.height - 44)
        progress.setProgress(0.01, animated: false)
        
        view.addSubview(progress)
        
        navigationController?.navigationBar.barTintColor = UIColor.random()
    }
    
     @objc func pushViewController() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "sonController")
        vc.view.backgroundColor = UIColor.random()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let coordinator = transitionCoordinator else { return }
        let oriProgress = progress.progress
        let oriBarTintColor = navigationController?.navigationBar.barTintColor
        let oriButtonTintColor = pushBtn.tintColor
        let oriButtonBackgroundColor = pushBtn.backgroundColor
        let oriButtonCornerRadius = pushBtn.layer.cornerRadius
        coordinator.animate(alongsideTransition: { (context) in
            print("viewWillAppear start")
            self.progress.setProgress(0.01, animated: true)
            self.pushBtn.tintColor = UIColor.randomLight()
            self.pushBtn.backgroundColor = UIColor.randomDark()
            self.pushBtn.layer.cornerRadius = self.pushBtn.bounds.height * 0.309
            self.pushBtn.setNeedsDisplay()
            self.navigationController?.navigationBar.barTintColor = self.toColor()
            print("...")
        }) { (context) in
            if context.isCancelled {
                print("viewWillAppear cancelled\n")
                self.progress.setProgress(oriProgress, animated: true)
                self.pushBtn.tintColor = oriButtonTintColor
                self.pushBtn.backgroundColor = oriButtonBackgroundColor
                self.pushBtn.layer.cornerRadius = oriButtonCornerRadius
                self.pushBtn.setNeedsDisplay()
                self.navigationController?.navigationBar.barTintColor = oriBarTintColor
            } else {
                print("viewWillAppear done\n")
            }
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let oriProgress = progress.progress
        let oriBarTintColor = navigationController?.navigationBar.barTintColor
        let oriButtonTintColor = pushBtn.tintColor
        let oriButtonBackgroundColor = pushBtn.backgroundColor
        let oriButtonCornerRadius = pushBtn.layer.cornerRadius
        guard let coordinator = transitionCoordinator else { return }
        coordinator.animate(alongsideTransition: { (context) in
            print("viewWillDisappear start")
            self.progress.setProgress(1, animated: true)
            self.pushBtn.tintColor = UIColor.randomLight()
            self.pushBtn.backgroundColor = UIColor.randomDark()
            self.pushBtn.layer.cornerRadius = self.pushBtn.bounds.height * 0.5
            self.pushBtn.setNeedsDisplay()
            self.navigationController?.navigationBar.barTintColor = self.toColor()
            print("...")
        }) { (context) in
            if context.isCancelled {
                print("viewWillDisappear cancelled\n")
                self.progress.setProgress(oriProgress, animated: true)
                self.pushBtn.tintColor = oriButtonTintColor
                self.pushBtn.backgroundColor = oriButtonBackgroundColor
                self.pushBtn.layer.cornerRadius = oriButtonCornerRadius
                self.pushBtn.setNeedsDisplay()
                self.navigationController?.navigationBar.barTintColor = oriBarTintColor
            } else {
                print("viewWillDisappear done\n")
                self.progress.setProgress(1, animated: true)
            }
        }
    }
    
}
