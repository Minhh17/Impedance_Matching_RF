import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    // width: 1920
    // height: 1080
    // // Popup {
    id: aboutPopup
    width: 750
    height: 500
    anchors.centerIn: parent
    // modal: true
    focus: true

    Rectangle {
        color: "lightblue"
        anchors.centerIn: parent
        width: parent.width - 20
        height: parent.height - 20

        Text {
            text: "About Me"
            font.bold: true
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 10
        }

        Column {
            y: 101
            spacing: 10
            anchors.top: title.bottom
            anchors.horizontalCenterOffset: -143
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 10

            Text {
                text: "Họ và tên: Nguyễn Hải Minh"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
            Text {
                text: "MSSV: 20214006"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
            Text {
                text: "Lớp: Điện tử 07"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
            Text {
                text: "Lớp môn học: 150111"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
            Text {
                text: "Bài tập lớn Điện tử tương tự II"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
            Text {
                text: "GVHD: Nguyễn Nam Phong"
                font.pixelSize: 22 // Kích thước phông chữ được tăng lên
            }
        }
    }
    // }
}
