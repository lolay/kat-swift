//
//  Copyright © 2019, 2023 Lolay, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import UIKit

public extension UIImage {
    /**
     Creates an image with a particular color for use with `UISearchBar:searchFieldBackgroundImage(for:)`
     that looks like the standard one. This is the only "official" way to change search field background
     color. Height and padding are used as the searchbar bounds is much larger than expected and any image
     would be taller than expected. The padding allows this to offset the edges of the non-transparent
     color.
     - parameter color: Color of the search field background
     - parameter radius: The radius to round the corners
     - parameter height: The height of the search bar. If `nil`, it will calculate a minimum height.
     - parameter padding: Padding for the image to be clear
    */
    class func searchFieldBackgroundImageWithColor(_ color: UIColor, radius: CGFloat = 10.0, height: CGFloat? = 38.0, padding: UIEdgeInsets = UIEdgeInsets(top: 4.0, left: 0.0, bottom: 4.0, right: 0.0)) -> UIImage? {
        assert(radius >= 0.0, "Radius must be zero or greater")
        assert(padding.top >= 0.0, "Top padding must be zero or greater")
        assert(padding.left >= 0.0, "Left padding must be zero or greater")
        assert(padding.bottom >= 0.0, "Bottom padding must be zero or greater")
        assert(padding.right >= 0.0, "Right padding must be zero or greater")

        let minimumHeight = radius * 2.0 + 1.0 + padding.top + padding.bottom
        
        let imageHeight: CGFloat = {
            if let height = height {
                assert(height > 0.0, "Height must be zero or greater")
                assert(height >= minimumHeight, "Height is not tall enough for the given radius, top and bottom padding needs to be at least \(minimumHeight)")
                return height
            } else {
                return minimumHeight
            }
        }()
        
        let width = radius * 2.0 + 1.0 + padding.left + padding.right
        let bounds = CGSize(width: width, height: imageHeight)
        
        let origin = CGPoint(x: padding.left, y: padding.top)
        let size = CGSize(width: width - padding.left - padding.right, height: imageHeight - padding.top - padding.bottom)
        let rect = CGRect(origin: origin, size: size)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath
        
        UIGraphicsBeginImageContextWithOptions(bounds, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        color.setFill()
        context?.move(to: origin)
        context?.addPath(path)
        context?.drawPath(using: .fill)
        
        let rawImage = UIGraphicsGetImageFromCurrentImageContext()
        context?.restoreGState()
        UIGraphicsEndImageContext()
        
        let capInsets = UIEdgeInsets(top: padding.top + radius, left: padding.left + radius, bottom: padding.bottom + radius, right: padding.right + radius)
        let resizableImage = rawImage!.resizableImage(withCapInsets: capInsets)
        return resizableImage
    }
    
    /**
     Draws an image that is entirely filled with the given color
     - parameter color: The color to fill the image with
     - parameter size: The size of the image (typically recommend the default of 1x1 and let it be stretched
    */
    class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        assert(size.width > 0.0, "Width must be greater than 0")
        assert(size.height > 0.0, "Height must be greater than 0")
        
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /**
     Clips the corners of an image using the given radius.
     - parameter radius: The corner radius
    */
    func withRoundCorners(_ radius: CGFloat) -> UIImage? {
        assert(radius > 0.0, "Radius must be greater than 0")
        assert(radius * 2.0 <= self.size.height, "Radius must be at most half the height")
        assert(radius * 2.0 <= self.size.width, "Radius must be at most half the width")

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        
        context?.beginPath()
        context?.addPath(path.cgPath)
        context?.closePath()
        context?.clip()
        
        draw(at: CGPoint.zero)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return image;
    }
}
