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

import XCTest
@testable import LolayKat
import os.log

final class LolayArcTests: XCTestCase {
    private static let log = Logger(subsystem: "LolayKat", category: "LolayArcTests")
    /// Simple test that really just makes sure it doesn't break. Not sure how to verify Path output.
    func testPath() {
        let arc = LolayArc()
        let normalRect = CGRect(x: -10.0, y: 20.0, width: 150.0, height: 50.0)
        let normalPath = arc.path(in: normalRect)
        Self.log.debug("normalPath=\(String(describing: normalPath), privacy: .public)");
        XCTAssertNotNil(normalPath)
        XCTAssertEqual(round(normalPath.boundingRect.width), round(normalRect.width))
        XCTAssertEqual(round(normalPath.boundingRect.height), round(normalRect.height))
    }
}
