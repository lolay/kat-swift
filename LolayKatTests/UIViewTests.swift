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

import XCTest
@testable import LolayKat

final class UIViewTests: XCTestCase {
    class ViewA: UIView { }
    class ViewB: UIView { }
    class ViewC: UIView { }
    
    func testSearchSubviewsNamed() {
        let root = UIView(frame: .zero)
        let view1 = UIView(frame: .zero)
        root.addSubview(view1)
        let viewA = ViewA(frame: .zero)
        view1.addSubview(viewA)
        let viewB = ViewB(frame: .zero)
        root.addSubview(viewB)
        let viewC = ViewC(frame: .zero)
        viewB.addSubview(viewC)
        
        let viewAs = root.searchSubviews(named: "ViewA")
        XCTAssert(viewAs.contains(viewA), "Search failed for a direct subview")

        let viewBs = root.searchSubviews(named: "ViewB")
        XCTAssert(viewBs.contains(viewB), "Search failed for a nested subview")
        
        let viewCs = root.searchSubviews(named: "ViewC")
        XCTAssert(viewCs.contains(viewC), "Search failed for a subview nested in another searched view")
    }

    func testSearchSubviewsTyped() {
        let root = UIView(frame: .zero)
        let view1 = UIView(frame: .zero)
        root.addSubview(view1)
        let viewA = ViewA(frame: .zero)
        view1.addSubview(viewA)
        let viewB = ViewB(frame: .zero)
        root.addSubview(viewB)
        let viewC = ViewC(frame: .zero)
        viewB.addSubview(viewC)
        
        let viewAs: [ViewA] = root.searchSubviews(viewType: ViewA.self)
        XCTAssert(viewAs.contains(viewA), "Search failed for a direct subview")
        
        let viewBs = root.searchSubviews(viewType: ViewB.self)
        XCTAssert(viewBs.contains(viewB), "Search failed for a nested subview")
        
        let viewCs = root.searchSubviews(viewType: ViewC.self)
        XCTAssert(viewCs.contains(viewC), "Search failed for a subview nested in another searched view")
    }
    
    func testAddLeadingToTrailingConstraints() {
        let parent = UIView(frame: .zero)
        let child = UIView(frame: .zero)
        parent.addSubview(child)
        
        XCTAssertEqual(parent.constraints.count, 0)
        XCTAssertEqual(child.constraints.count, 0)
        
        child.addLeadingToTrailingConstraints()
        
        XCTAssertEqual(parent.constraints.count, 4)
        XCTAssertEqual(child.constraints.count, 0)
    }
}
