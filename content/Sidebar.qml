import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2

Item {
    width: 1920
    height: 1080

    property bool sidebarVisible: false // Custom property for visibility control

    ColumnLayout {
        id: sidebarCol
        width: 350
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Rectangle {
            color: "lightblue"
            border.color: "#93003b58"
            Layout.fillHeight: true
            Layout.fillWidth: true

            // Navigation buttons
            Button {
                x: 41
                y: 177
                width: 269
                height: 52
                text: "Theory"
                onClicked: {
                    console.log("Go to Home")
                }
            }
            Button {
                x: 41
                y: 105
                width: 269
                height: 52
                text: "About me"
                onClicked: aboutPopup.open()
            }
            Button {
                x: 41
                y: 249
                width: 269
                height: 52
                text: "Settings"
                onClicked: {
                    console.log("Go to Settings")
                }
            }
        }
    }

    Popup {
        id: aboutPopup
        width: 750
        height: 500
        modal: true
        focus: true
        anchors.centerIn: parent

        Loader {
            id: aboutLoader
            source: "Aboutme.qml"
            anchors.fill: parent
        }
    }
    // Animate the sidebar when it's shown or hidden
    Behavior on x {
        NumberAnimation {
            duration: 300
            easing.type: Easing.InOutQuad
        }
    }

}


