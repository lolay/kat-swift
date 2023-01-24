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

public extension UITabBarItem {
    /*
     Sets the badge value for a tab. I it exceeds `max` it sets it to "String(max) + \"+\"".
     If it's `0` it sets it to an empty string.
     - parameter value: The current value to set the badge to
     - parameter max: The max after which to apend a "+" to the value
     */
    func setBadgeValue(_ value: Int, max: Int? = nil) {
        if value <= 0 {
            self.badgeValue = nil
        } else if let max = max, value > max {
            self.badgeValue = String(max) + "+"
        } else {
            self.badgeValue = String(value)
        }
    }
}
