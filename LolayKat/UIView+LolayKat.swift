//
//  Copyright © 2019 Lolay, Inc.
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

public extension UIView {
    /**
     Searches all subviews, recursively to find views where the type name
     matches the given name.
     - parameter named: The type name to search for
    */
    func searchSubviews(named: String) -> [UIView] {
        var matchedViews: [UIView] = []
        for subview in self.subviews {
            let name = String(describing: type(of: subview))
            if name == named {
                matchedViews.append(subview)
            }

            matchedViews.append(contentsOf: subview.searchSubviews(named: named))
        }

        return matchedViews
    }
    
    /**
     Searches all subviews, recursively to find views whre the type matches the
     given type.
     - parameter viewType: The type to search for
    */
    func searchSubviews<T>(viewType: T.Type) -> [T] {
        var matchedViews: [T] = []
        for subview in self.subviews {
            if let matchedView = subview as? T {
                matchedViews.append(matchedView)
            }

            matchedViews.append(contentsOf: subview.searchSubviews(viewType: viewType))
        }

        return matchedViews
    }
}
