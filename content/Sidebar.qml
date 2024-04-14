import QtQuick 6.2

Item {
    width: 350
    height: 1080

    property bool sidebarVisible: false // Custom property for visibility control

    Rectangle {
        id: sidebar
        width: 350
        height: parent.height
        color: "#c5ffb3"

        // Animate the sidebar when it's shown or hidden
        Behavior on x {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    }
}
