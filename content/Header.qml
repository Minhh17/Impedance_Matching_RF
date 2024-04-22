import QtQuick 6.2
import QtQuick.Controls 6.2

Item {
    width: 1920
    height: 65

    Rectangle {
        id: header
        x: 0
        y: 0
        width: 1920
        height: 65
        color: "#f2ff9f"

        Text {
            id: text1
            x: 678
            y: 0
            width: 564
            height: 65
            text: qsTr("RF Impedance Matching Tool")
            font.pixelSize: 42
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Bold"
            font.family: "Ubuntu"
        }
    }
}
