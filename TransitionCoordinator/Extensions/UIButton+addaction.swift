//
//  UIButton.swift
//  TransitionCoordinator
//
//  Created by Soleil Yu on 2019/4/2.
//  Copyright © 2019 Soleil Yu. All rights reserved.
//

import UIKit

extension UIButton {
    typealias ButtonAction = (_: Any) -> Void
    
    func addTouchUpInside(action: @escaping ButtonAction) {
        self.action = action
        self.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    }
    
    private struct AssociatedKeys {
        static var actionKey = "\(type(of: self))AcrtionKey"
    }
    
    @objc private var action: ButtonAction? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? ButtonAction
        }
    }
    
    @objc private func touchUpInsideAction() {
        if let action = self.action { action(self) }
    }
}
