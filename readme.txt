Cosmos Explorer (Qt 6.2.1, QML + C++)

Architecture and patterns:
- MVVM style separation with a C++ ViewModel exposed to QML.
- Repository pattern for astronomy lesson data.
- Declarative QML view layer with reusable components.

Build with QBS:
1) qbs build profile:qt6 config:release
2) run the resulting CosmosExplorer binary

Main files:
- app.qbs
- src/cosmosrepository.*
- src/cosmosviewmodel.*
- qml/main.qml
- qml/components/FactCard.qml
