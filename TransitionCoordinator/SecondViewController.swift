//
//  SecondViewController.swift
//  TransitionCoordinator
//
//  Created by Soleil Yu on 2019/4/2.
//  Copyright © 2019 Soleil Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    lazy var button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Go back", for: .normal)
        b.backgroundColor = UIColor.randomLight()
        b.tintColor = UIColor.randomDark()

        b.bounds = CGRect(x: 0, y: 0, width: view.bounds.width - 264, height: b.intrinsicContentSize.height + 22)
        b.center = view.center

        b.layer.masksToBounds = true
        b.layer.cornerRadius = b.bounds.height * 0.309

        b.addTouchUpInside(action: goBack(_:))
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.random()
        
        view.addSubview(button)
        
        
    }
    
    private func goBack(_: Any) {
        navigationController?.popViewController(animated: true)
    }

}
