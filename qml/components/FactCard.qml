import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: card
    property string title: ""
    property string subtitle: ""
    property string description: ""
    property string distance: ""
    property color accent: "#7AA5FF"

    radius: 18
    color: "#151B32"
    border.color: Qt.lighter(accent, 1.2)
    border.width: 1

    layer.enabled: true
    layer.smooth: true

    Column {
        anchors.fill: parent
        anchors.margins: 18
        spacing: 10

        Rectangle {
            width: 110
            height: 30
            radius: 15
            color: accent

            Label {
                anchors.centerIn: parent
                text: "Lesson"
                color: "#08111F"
                font.bold: true
            }
        }

        Label {
            text: title
            color: "#F0F4FF"
            font.pixelSize: 30
            font.bold: true
            wrapMode: Label.Wrap
        }

        Label {
            text: subtitle
            color: Qt.lighter(accent, 1.1)
            font.pixelSize: 20
            wrapMode: Label.Wrap
        }

        Label {
            text: description
            color: "#D7E0FF"
            font.pixelSize: 16
            wrapMode: Label.Wrap
            width: parent.width
        }

        Label {
            text: "Distance: " + distance
            color: "#BBC8FF"
            font.pixelSize: 14
            wrapMode: Label.Wrap
        }
    }
}
