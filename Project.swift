import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: .GeoHelper,
    targets: [
        .target(
            name: .GeoHelper,
            dependencies: [
                .external(name: .Alamofire)
            ]
        ),
        .target(
            name: .GeoHelperTests,
            product: .unitTests,
            sources: .tests,
            dependencies: [.target(name: .GeoHelper)]
        )
    ],
    additionalFiles: ["README.MD", "Package.swift", "GeoHelper.podspec"]
)
