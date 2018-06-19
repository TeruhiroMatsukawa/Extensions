//
// Created by Teruhiro Matsukawa on 2018/06/19.
// Copyright (c) 2018 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage
{
    /// 特定の色で塗りつぶされたUIImageを生成
    public convenience init(color: UIColor, size: CGSize)
    {
        UIGraphicsBeginImageContext(size)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else
        {
            self.init()
            return
        }

        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))

        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else
        {
            self.init()
            return
        }
        UIGraphicsEndImageContext()

        if let cgImage = image.cgImage
        {
            self.init(cgImage: cgImage)
        }
        else
        {
            self.init()
        }
    }
}

/**
    usage

    UIImage(color: .red, size: .init(width: 100, height: 100))
*/