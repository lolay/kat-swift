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

/**
 Adds text padding to a UILabel
 */
@IBDesignable class LolayPaddedLabel: UILabel {
    @IBInspectable var topPadding: CGFloat = 0.0
    @IBInspectable var bottomPadding: CGFloat = 0.0
    @IBInspectable var leadingPadding: CGFloat = 0.0
    @IBInspectable var trailingPadding: CGFloat = 0.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: self.topPadding, left: self.leadingPadding, bottom: self.bottomPadding, right: self.trailingPadding)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + self.leadingPadding + self.trailingPadding
        let height = size.height + self.topPadding + self.bottomPadding
        return CGSize(width: width, height: height)
    }
}
