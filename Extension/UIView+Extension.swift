//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit

public extension UIView
{
    public func fillSuperview()
    {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints

        if translatesAutoresizingMaskIntoConstraints
        {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        }
        else
        {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        }
    }
}

/**
    usage

    superView.addSubview(view)
    view.fillSuperview()
*/