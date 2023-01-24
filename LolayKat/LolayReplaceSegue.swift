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

/**
 Instead of just pushing on top of the stack, this will replace the top controller with the destination controller.
 This can only be applied to a Show in a navigation controller. Otherwise it will do a standard segue.
 */
public class LolayReplaceSegue: UIStoryboardSegue {
    /// The depth that this should replace. Default is to just replace the top one.
    @IBInspectable public var depth: Int = 1
    
    override public func perform() {
        if self.depth > 0, let navigationController = self.source.navigationController {
            let count = navigationController.viewControllers.count
            if self.depth > count {
                navigationController.setViewControllers([self.destination], animated: true)
            } else {
                var viewControllers = navigationController.viewControllers
                let start = count - self.depth
                let end = count - 1
                viewControllers.removeSubrange(start...end)
                viewControllers.append(self.destination)
                navigationController.setViewControllers(viewControllers, animated: true)
            }
            
            // Do the default behavior
        } else {
            super.perform()
        }
    }
}
