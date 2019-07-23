//
//  UIView.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import SnapKit

extension UIView {
    func addSubview(view: UIView, _ closure: (_ make: ConstraintMaker) -> Void) {
        self.addSubview(view)
        view.snp.makeConstraints(closure)
    }
}
