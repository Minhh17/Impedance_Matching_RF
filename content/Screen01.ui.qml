

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import IMRF

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    //DISPLAY SECTION
    Rectangle {
        id: display
        x: 72
        y: 128
        width: 1010
        height: 825
        color: "#ffffff"
    }

    Rectangle {
        id: configure
        x: 1170
        y: 128
        width: 608
        height: 825
        color: "#ffffff"
    }

    states: [
        State {
            name: "clicked"
            when: button.checked

            PropertyChanges {
                target: label
                text: qsTr("Button Checked")
            }
        }
    ]
    Button {
        id: button
        width: 234
        height: 82
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 341
        anchors.horizontalCenterOffset: -48
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: button
            onClicked: animation.start()
        }
    }
    Text {
        id: label
        x: 132
        y: 176
        width: 162
        height: 50
        text: qsTr("Hello IMRF")
        font.pointSize: 20
        font.family: Constants.font.family

        SequentialAnimation {
            id: animation

            ColorAnimation {
                id: colorAnimation1
                target: rectangle
                property: "color"
                to: "#2294c6"
                from: Constants.backgroundColor
            }

            ColorAnimation {
                id: colorAnimation2
                target: rectangle
                property: "color"
                to: Constants.backgroundColor
                from: "#2294c6"
            }
        }
    }
}
