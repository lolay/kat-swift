// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
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

import PackageDescription

let package = Package(
    name: "LolayKat",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1),
        .macCatalyst(.v17)
    ],
    products: [
        .library(
            name: "LolayKat",
            targets: ["LolayKat"]),
    ],
    targets: [
        .target(
            name: "LolayKat",
            dependencies: []
        ),
        .testTarget(
            name: "LolayKatTests",
            dependencies: ["LolayKat"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
