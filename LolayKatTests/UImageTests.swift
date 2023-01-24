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

import XCTest
@testable import LolayKat

final class UIImageTests: XCTestCase {
    func testSearchFieldBackgroundImageWithColor() {
        let image1 = UIImage.searchFieldBackgroundImageWithColor(UIColor.black, radius: 10.0, height: 38.0, padding: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        XCTAssertNotNil(image1)
        XCTAssertEqual(image1?.size, CGSize(width: 21, height: 38))

        let image2 = UIImage.searchFieldBackgroundImageWithColor(UIColor.black, radius: 10.0, height: nil, padding: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        XCTAssertNotNil(image2)
        XCTAssertEqual(image2?.size, CGSize(width: 21, height: 21))
    }
    
    func testImageWithColor() {
        let image1 = UIImage.imageWithColor(UIColor.black, size: CGSize(width: 10, height: 10))
        XCTAssertNotNil(image1)
        XCTAssertEqual(image1?.size, CGSize(width: 10, height: 10))
    }
    
    func testWithRoundCorners() {
        let image = UIImage.imageWithColor(UIColor.black, size: CGSize(width: 10, height: 10))
        let image1 = image?.withRoundCorners(2.0)
        XCTAssertNotNil(image1)
        XCTAssertEqual(image1?.size, CGSize(width: 10, height: 10))
    }
}
