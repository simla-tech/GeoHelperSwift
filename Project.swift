import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: .GeoHelper,
    targets: [
        Target(
            name: .GeoHelper,
            dependencies: [
                .external(name: .Alamofire)
            ]
        ),
        Target(
            name: .GeoHelperTests,
            product: .unitTests,
            sources: .defaultTestsPath,
            dependencies: [.target(name: .GeoHelper)]
        )
    ]
)
