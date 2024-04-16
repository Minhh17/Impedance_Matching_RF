
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2
import IMRF

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    //DISPLAY SECTION
    Rectangle {
        id: display
        x: 35
        y: 92
        width: 1074
        height: 910
        color: "#f0f0f0"

        Image {
            id: l_a
            x: 249
            y: 220
            source: "images/L_a.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

    // CONFIGURE SECTION
    Rectangle {
        id: configure
        x: 1158
        y: 92
        color: "#f0f0f0"
        width: 646
        height: 910

        Label {
            id: configureLabel
            x: 133
            y: 20
            text: "IMRF Parameters Configure"
            font.bold: true
            font.pixelSize: 26
            Layout.alignment: Qt.AlignHCenter
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.leftMargin: 43
            anchors.rightMargin: 43
            anchors.topMargin: 56
            anchors.bottomMargin: 13
            spacing: 0

            // Selecting RF Circuit type
            Label {
                text: "Circuit types"
            }
            RowLayout {
                id: circuitTypeRow
                ComboBox {
                    id: circuitType
                    editable: false
                    Layout.fillWidth: true

                    model: ["L Shaped Matching", "Pi Shaped Matching", "T Shaped Matching"]

                    // Selected RF type
                    onCurrentTextChanged: {
                        console.log("Selected Circuit type:", currentText)
                    }
                }
            }

            //Circuit DC Current
            Label {
                text: "DC Current Types"
            }
            RowLayout {
                id: dcCurrentRow
                ComboBox {
                    id: dcCurrent
                    editable: false
                    Layout.fillWidth: true

                    model: ["Block DC", "Feed DC"]

                    // Selected RF type
                    onCurrentTextChanged: {
                        console.log("Selected DC type:", currentText)
                    }
                }
            }

            // Frequency
            Label {
                text: "Frequency (F)"
            }
            RowLayout {
                id: freqRow
                // Enter freq
                TextField {
                    id: frequencyTxF
                    width: 420
                    placeholderText: "Enter frequency"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Freq:", text)
                    }
                }

                // Selecting freq unit
                ComboBox {
                    id: freqUnit
                    width: 100
                    editable: false
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.2

                    // Populate dropdown with frequency units
                    model: ["MHz", "GHz"]

                    onCurrentTextChanged: {
                        console.log("Selected Freq Unit:", currentText)
                    }
                }
            }

            // Source Resistance
            Label {
                text: "Source Resistance (Rs)"
            }
            RowLayout {
                id: rsRow
                // Enter rs
                TextField {
                    id: rs
                    width: 420
                    placeholderText: "Enter Source Resistance"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Source Resistance:", text)
                    }
                }
                // Selecting Source Resistance unit
                ComboBox {
                    id: rsUnit
                    width: 100
                    editable: false
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.2

                    // Populate dropdown with Source Resistance units
                    model: ["M Ohm", "G Ohm"]

                    onCurrentTextChanged: {
                        console.log("Selected Source Resistance Unit:", currentText)
                    }
                }
            }

            // Source Reactance
            Label {
                text: "Source Reactance (Xs)"
            }
            RowLayout {
                id: xsRow
                // Enter xs
                TextField {
                    id: xs
                    width: 420
                    placeholderText: "Enter Source Reactance"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Source Reactance:", text)
                    }
                }
                // Selecting Source Reactance unit
                ComboBox {
                    id: xsUnit
                    width: 100
                    editable: false
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.2

                    // Populate dropdown with Source Reactance units
                    model: ["M Ohm", "G Ohm"]

                    onCurrentTextChanged: {
                        console.log("Selected Source Reactance Unit:", currentText)
                    }
                }
            }

            // Load Resistance
            Label {
                text: "Load Resistance (RL)"
            }
            RowLayout {
                id: rlRow
                // Enter rl
                TextField {
                    id: rl
                    width: 420
                    placeholderText: "Enter Load Resistance"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Load Resistance:", text)
                    }
                }
                // Selecting Load Resistance unit
                ComboBox {
                    id: rlUnit
                    width: 100
                    editable: false
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.2

                    // Populate dropdown with Load Resistance units
                    model: ["M Ohm", "G Ohm"]

                    onCurrentTextChanged: {
                        console.log("Selected Load Resistance Unit:", currentText)
                    }
                }
            }

            //Load Reactance
            Label {
                text: "Load Reactance (XL)"
            }
            RowLayout {
                id: xlRow
                // Enter xl
                TextField {
                    id: xl
                    width: 420
                    placeholderText: "Enter Load Reactance"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Load Reactance:", text)
                    }
                }
                // Selecting Load Reactance unit
                ComboBox {
                    id: xlUnit
                    width: 100
                    editable: false
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.2

                    // Populate dropdown with Load Reactance units
                    model: ["M Ohm", "G Ohm"]

                    onCurrentTextChanged: {
                        console.log("Selected Load Reactance Unit:", currentText)
                    }
                }
            }

            //Q Factor
            Label {
                text: "Q Factor (Q)"
            }
            RowLayout {
                id: qFactorRow
                // Enter Q Factor
                TextField {
                    id: qFactor
                    width: 420
                    placeholderText: "Enter Q Factor"
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {
                        console.log("Entered Q Factor:", text)
                    }
                }
            }




            // Add more parameters as needed
            // ...

            // Button to apply settings
            Button {
                text: "Apply"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    applySettings()
                }
            }
        }
    }

    function applySettings() {
        var rfType = rfTypeDropdown.currentText
        var frequency = frequencyInput.text
        var frequencyUnit = frequencyUnitDropdown.currentText
        var impedance = impedanceInput.text
        var impedanceUnit = impedanceUnitDropdown.currentText
        var impedanceLoad = impedanceLoadInput.text
        var impedanceLoadUnit = impedanceLoadUnitDropdown.currentText

        console.log("Applying RF Settings:")
        console.log("RF Type:", rfType)
        console.log("Frequency:", frequency, frequencyUnit)
        console.log("Impedance Input:", impedance, impedanceUnit)
        console.log("Impedance Load:", impedanceLoad, impedanceLoadUnit)
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
        x: 98
        y: 156
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
