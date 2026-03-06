import qbs

Project {
    minimumQbsVersion: "1.19"

    CppApplication {
        name: "CosmosExplorer"
        consoleApplication: false

        cpp.cxxLanguageVersion: "c++17"

        Depends { name: "cpp" }
        Depends { name: "Qt"; submodules: ["core", "gui", "qml", "quick", "quickcontrols2"] }

        files: [
            "src/main.cpp",
            "src/cosmosrepository.h",
            "src/cosmosrepository.cpp",
            "src/cosmosviewmodel.h",
            "src/cosmosviewmodel.cpp",
            "qml/main.qml",
            "qml/components/FactCard.qml",
            "resources.qrc",
            "ATTRIBUTION.md"
        ]
    }
}
