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

final class UITabBarItemTests: XCTestCase {
    func testBadgeValue() {
        let item = UITabBarItem(title: nil, image: nil, tag: 0)
        XCTAssertNil(item.badgeValue)
        
        item.setBadgeValue(-1)
        XCTAssertNil(item.badgeValue)
        
        item.setBadgeValue(50)
        XCTAssertEqual(item.badgeValue, "50")
        
        item.setBadgeValue(100, max: 99)
        XCTAssertEqual(item.badgeValue, "99+")
        
        item.setBadgeValue(99, max: 99)
        XCTAssertEqual(item.badgeValue, "99")
    }
}
