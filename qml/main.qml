import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "components"

ApplicationWindow {
    id: root
    visible: true
    width: 1200
    height: 760
    title: "Cosmos Explorer"
    color: "#05070E"

    readonly property var lesson: cosmosViewModel.currentLesson

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#0C1027" }
            GradientStop { position: 1.0; color: "#02030A" }
        }

        Repeater {
            model: 80
            Rectangle {
                width: 2
                height: 2
                radius: 1
                color: "white"
                opacity: 0.2 + Math.random() * 0.8
                x: Math.random() * root.width
                y: Math.random() * root.height

                SequentialAnimation on opacity {
                    loops: Animation.Infinite
                    NumberAnimation { to: 0.1; duration: 1200 + Math.random() * 1800 }
                    NumberAnimation { to: 0.9; duration: 900 + Math.random() * 1400 }
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 28

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id: imageFrame
                anchors.fill: parent
                radius: 24
                color: "#090F20"
                border.width: 1
                border.color: Qt.lighter(lesson.accent || "#7AA5FF", 1.15)
                clip: true

                Image {
                    id: heroImage
                    anchors.fill: parent
                    source: lesson.imageUrl || ""
                    fillMode: Image.PreserveAspectCrop
                    asynchronous: true
                    cache: true
                    smooth: true
                }

                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#00000000" }
                        GradientStop { position: 1.0; color: "#99000000" }
                    }
                }

                Behavior on border.color {
                    ColorAnimation { duration: 450 }
                }

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation { target: heroImage; property: "scale"; from: 1.0; to: 1.05; duration: 6000; easing.type: Easing.InOutSine }
                    NumberAnimation { target: heroImage; property: "scale"; from: 1.05; to: 1.0; duration: 6000; easing.type: Easing.InOutSine }
                }

                Label {
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 20
                    anchors.bottomMargin: 20
                    text: "Open-source image: Wikimedia Commons"
                    color: "#E5EBFF"
                    font.pixelSize: 14
                }
            }
        }

        FactCard {
            Layout.preferredWidth: 430
            Layout.fillHeight: true
            title: lesson.title || ""
            subtitle: lesson.subtitle || ""
            description: lesson.description || ""
            distance: lesson.distance || ""
            accent: lesson.accent || "#7AA5FF"

            ColumnLayout {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 18
                spacing: 12

                RowLayout {
                    spacing: 10

                    Button {
                        text: "◀ Previous"
                        onClicked: cosmosViewModel.previousLesson()
                    }

                    Button {
                        text: "Next ▶"
                        onClicked: cosmosViewModel.nextLesson()
                    }
                }

                Label {
                    text: "Tip: Use lessons to discuss stars, galaxies, and nebulae in class."
                    color: "#AFC0FF"
                    font.pixelSize: 13
                    wrapMode: Label.Wrap
                    Layout.fillWidth: true
                }
            }
        }
    }

    Keys.onLeftPressed: cosmosViewModel.previousLesson()
    Keys.onRightPressed: cosmosViewModel.nextLesson()
}
