//
//  Copyright © 2023 Lolay, Inc.
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
import SwiftUI

/**
 This will draw an arc that intersects the left-bottom and right-bottom most corners of a
 rectangle with the top of the arc centered in the rectangle.
 - See also:
 [Core Graphics Tutorial: Arcs and Paths
](https://www.kodeco.com/349664-core-graphics-tutorial-arcs-and-paths)
 */
public struct LolayArc: Shape {
    public init() { }
    
    public func path(in rect: CGRect) -> Path {
        // Don't forget Core Graphics origin is bottom left with Y going "up"
        // While UI Kit origin is top left with Y going "down"
        let width = rect.width
        let height = rect.height
        
        let ab = width / 2.0
        let c = height
        let d = pow(ab, 2.0) / c
        let r = (d + c) / 2.0
        
        let center = CGPoint(
            x: rect.origin.x + ab,
            y: rect.origin.y + r)
        
        let theta = atan(ab / (r - c))
        
        let offsetAngle = (3.0 * .pi / 2.0)
        let startAngle = Angle(radians: offsetAngle + theta)
        let endAngle = Angle(radians: offsetAngle - theta)
        
        var path = Path()
        let startPoint = CGPoint(x: rect.origin.x, y: rect.origin.y + height)
        let endPoint = CGPoint(x: rect.origin.x + width, y: rect.origin.y + height)
        path.move(to: startPoint)
        path.addArc(center: center, radius: r, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.addLine(to: endPoint)
        path.addLine(to: startPoint)
        return path
    }
}
