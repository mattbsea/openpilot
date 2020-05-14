import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        anchors.fill: parent
        color: "blue"
        Row {
            anchors.centerIn: parent
            Image {
                width: window.width / 3
                source: "qrc:/assets/img_map.png"
            }
            Image {
                width: window.width / 3
                source: "qrc:/assets/img_trafficLight_red.png"
            }
        }
    }

}
