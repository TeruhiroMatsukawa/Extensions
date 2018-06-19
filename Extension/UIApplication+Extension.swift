//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication
{
    public var topViewController: UIViewController?
    {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }

        while let presentedViewController = topViewController.presentedViewController
        {
            topViewController = presentedViewController
        }
        return topViewController
    }

    public var topNavigationController: UINavigationController?
    {
        return topViewController as? UINavigationController
    }
}

/**
    usage

    UIApplication.shared.topViewController
*/