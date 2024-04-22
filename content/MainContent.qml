/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Layouts 6.2
import CustomTypes 1.0
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

        Rectangle {
            id: lDisplayRec
            x: 628
            y: 20
            width: 414
            height: 180
            visible: true
            color: "#ffffff"


            Text {
                id: cValueText
                x: 39
                y: 25
                width: 250
                height: 50
                text: qsTr("C = ")
                font.pixelSize: 24
            }

            Text {
                id: lValueText
                x: 39
                y: 78
                width: 250
                height: 60
                text: qsTr("L =")
                font.pixelSize: 24
            }


            Text {
                id: qValueText
                x: 39
                y: 133
                width: 250
                height: 58
                text: qsTr("Q = ")
                font.pixelSize: 24
                visible: true
            }
        }

        // C-L-C Display
        Rectangle {
            id: clcDisplayRec
            x: 628
            y: 20
            width: 414
            height: 180
            visible: false
            color: "#ffffff"
            Text {
                id: c1ValueText
                x: 39
                y: 25
                width: 250
                height: 50
                text: qsTr("C1 = ")
                font.pixelSize: 24
            }

            Text {
                id: lValueText1
                x: 39
                y: 78
                width: 250
                height: 60
                text: qsTr("L =")
                font.pixelSize: 24
            }

            Text {
                id: c2ValueText
                x: 39
                y: 133
                width: 250
                height: 58
                text: qsTr("C2 = ")
                font.pixelSize: 24
            }
        }

        // L-C-L Display
        Rectangle {
            id: lclDisplayRec
            x: 628
            y: 20
            width: 414
            height: 180
            visible: false
            color: "#ffffff"
            Text {
                id: l1ValueText
                x: 39
                y: 25
                width: 250
                height: 50
                text: qsTr("L1 = ")
                font.pixelSize: 24
            }

            Text {
                id: cValueText1
                x: 39
                y: 78
                width: 250
                height: 60
                text: qsTr("C =")
                font.pixelSize: 24
            }

            Text {
                id: l2ValueText
                x: 39
                y: 133
                width: 250
                height: 58
                text: qsTr("L2 = ")
                font.pixelSize: 24
            }
        }

        Image {
            id: circuitImage
            x: 163
            y: 322
            source: "images/L_a.svg"
            fillMode: Image.PreserveAspectFit
        }


        Rectangle {
            id: rectangle2
            x: 38
            y: 22
            width: 414
            height: 178
            color: "#ffffff"


            Text {
                id: zsourceText
                x: 25
                y: 21
                width: 250
                height: 38
                text: qsTr("Zsource = Rs + jXs");
                font.pixelSize: 24
            }

            Text {
                id: zloadText
                x: 25
                y: 61
                width: 250
                height: 36
                text: qsTr("Zload = RL + jXL")
                font.pixelSize: 24
            }

            Text {
                id: freqText
                x: 25
                y: 99
                width: 250
                height: 37
                text: qsTr("Frequency =")
                font.pixelSize: 24
            }

            Text {
                id: qInputText
                x: 25
                y: 134
                width: 250
                height: 37
                text: qsTr("Q Factor = ")
                font.pixelSize: 24
            }
        }

        Image {
            id: arow
            x: 458
            y: 54
            width: 164
            height: 124
            source: "images/arow.svg"
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
                        changeImage();
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

                    model: ["Feed DC", "Block DC"]

                    // Selected RF type
                    onCurrentTextChanged: {
                        changeImage();
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
                    // validator: DoubleValidator {
                    //     bottom: 0
                    //     top: 9999999999999.99
                    // }

                    onTextChanged: {
                        freqText.text = "Frequency = " + frequencyTxF.text +" "+ freqUnit.currentText
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
                    model: ["Hz", "MHz", "GHz"]

                    onCurrentTextChanged: {
                        freqText.text = "Frequency = " + frequencyTxF.text +" "+ freqUnit.currentText
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
                    // validator: DoubleValidator {
                    //     bottom: -99999999.99 // Giới hạn dưới của số double
                    //     top: 99999999.99     // Giới hạn trên của số double
                    // }
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width * 0.8

                    onTextChanged: {

                        if(rs.text === "" && xs.text === "") {
                            zsourceText.text = "Zsource = Rs + jXs"
                        }
                        else {
                            zsourceText.text = "Zsource =" + rs.text +" +"+ xs.text + "j"
                        }
                        changeImage();
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
                    model: ["Ohm"]

                    onCurrentTextChanged: {
                        // console.log("Selected Source Resistance Unit:", currentText)
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
                    // validator: DoubleValidator {
                    //     bottom: -99999999.999999999999999999999999
                    //     top: 99999999.999999999999999999999999
                    // }

                    onTextChanged: {

                        if(xs.text === "") {
                            zsourceText.text = "Zsource = Rs + jXs"
                        }
                        else {
                            zsourceText.text = "Zsource =" + rs.text +" +"+ xs.text + "j"
                        }
                        changeImage();
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
                    model: ["Ohm"]

                    onCurrentTextChanged: {
                        // console.log("Selected Source Reactance Unit:", currentText)
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
                    // validator: DoubleValidator {
                    //     bottom: -99999999.99 // Giới hạn dưới của số double
                    //     top: 99999999.99     // Giới hạn trên của số double
                    // }

                    onTextChanged: {
                        changeImage();

                        if(rl.text === "") {
                            zloadText.text = "Zload = RL + jXL"
                        }
                        else {
                            zloadText.text = "Zload =" + rl.text + " +" + xl.text + "j"
                        }
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
                    model: ["Ohm"]

                    onCurrentTextChanged: {
                        // console.log("Selected Load Resistance Unit:", currentText)
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
                    // validator: DoubleValidator {
                    //     bottom: -99999999.99 // Giới hạn dưới của số double
                    //     top: 99999999.99     // Giới hạn trên của số double
                    // }

                    onTextChanged: {
                        if(xl.text === "") {
                            zloadText.text = "Zload = RL + jXL"
                        }
                        else {
                            zloadText.text = "Zload =" + rl.text +" +"+ xl.text + "j"
                        }
                        changeImage();
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
                    model: ["Ohm"]

                    onCurrentTextChanged: {
                        // console.log("Selected Load Reactance Unit:", currentText)
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
                    // validator: DoubleValidator {
                    //     bottom: 0// Giới hạn dưới của số double
                    //     top: 999.99     // Giới hạn trên của số double
                    // }

                    onTextChanged: {
                        qInputText.text = "Q Factor = " + qFactor.text;
                    }
                }
            }

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

    // Confirmation dialog
    // Dialog {
    //     id: confirmationDialog
    //     modal: true
    //     standardButtons: Dialog.Ok | Dialog.Cancel
    //     title: "Confirmation"
    //     anchors.centerIn: parent
    //     Text {
    //         id: confirmText
    //         text: qsTr("Are you sure you want to apply the settings?")
    //     }
    //     onAccepted: {
    //         console.log("Settings applied!")
    //     }
    // }

    function applySettings() {
        // confirmationDialog.open()
        var circuitTypeVar = circuitType.currentText
        var dcType = dcCurrent.currentText
        var freqVar = frequencyTxF.text
        var freqUnitVar = freqUnit.currentText
        var rsVar = Number.parseFloat(rs.text)
        var rsUnitVar = rsUnit.currentText
        var xsVar = Number.parseFloat(xs.text)
        var xsUnitVar = xsUnit.currentText
        var rlVar = Number.parseFloat(rl.text)
        var rlUnitVar = rlUnit.currentText
        var xlVar = Number.parseFloat(xl.text)
        var xlUnitVar = xlUnit.currentText
        var qVar = qFactor.text

        var result = settingHandle.applySettings(circuitTypeVar, dcType, freqVar, freqUnitVar,
                                                 rsVar, rsUnitVar, xsVar, xsUnitVar,
                                                 rlVar, rlUnitVar, xlVar, xlUnitVar,
                                                 qVar)

        cValueText.text = "C= " + roundNumber(result[0], 3) + " parad";
        lValueText.text = "L= " + roundNumber(result[1], 3) + " henry";
        qValueText.text = "Q= " + roundNumber(result[2], 3);

        c1ValueText.text = "C1= " + roundNumber(result[0], 3) + " parad";
        lValueText1.text = "L= " + roundNumber(result[1], 3)+ " henry";
        c2ValueText.text = "C2= " + roundNumber(result[2], 3)+ " parad";

        l1ValueText.text = "L1= " + roundNumber(result[0], 3)+ " henry";
        cValueText1.text = "C= " + roundNumber(result[1], 3)+ " parad";
        l2ValueText.text = "L2= " + roundNumber(result[2], 3)+ " henry";

        // console.log(result);
        // console.log("Applying RF Settings:")
        // console.log("Circuit Type:", circuitTypeVar)
        // console.log("DC Current Type: ", dcType)
        // console.log("Frequency:", freqVar, freqUnitVar)
        // console.log("Impedance Input:", rsVar, rsUnitVar, xsVar, xsUnitVar)
        // console.log("Impedance Load:", rlVar, rlUnitVar, xlVar, xlUnitVar)
    }

    function changeImage() {

        if (circuitType.currentText === "L Shaped Matching" && dcCurrent.currentText === "Feed DC" && Number.parseFloat(rs.text) < Number.parseFloat(rl.text)){
            circuitImage.source = "images/L_a.svg"
            lDisplayRec.visible = true;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = false;
        }
        else if (circuitType.currentText === "L Shaped Matching" && dcCurrent.currentText === "Feed DC" && Number.parseFloat(rs.text) > Number.parseFloat(rl.text)) {
            circuitImage.source = "images/L_b.svg"
            lDisplayRec.visible = true;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = false;
        }
        else if (circuitType.currentText === "L Shaped Matching" && dcCurrent.currentText === "Block DC" && Number.parseFloat(rs.text) < Number.parseFloat(rl.text)) {
            circuitImage.source = "images/L_c.svg"
            lDisplayRec.visible = true;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = false;
        }
        else if (circuitType.currentText === "L Shaped Matching" && dcCurrent.currentText === "Block DC" && Number.parseFloat(rs.text) > Number.parseFloat(rl.text)) {
            circuitImage.source = "images/L_d.svg"
            lDisplayRec.visible = true;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = false;
        }
        else if (circuitType.currentText === "Pi Shaped Matching" && dcCurrent.currentText === "Feed DC"){
            circuitImage.source = "images/pi_feed.svg"
            qInputText.visible = true;
            lDisplayRec.visible = false;
            clcDisplayRec.visible = true;
            lclDisplayRec.visible = false;
        }
        else if (circuitType.currentText === "Pi Shaped Matching" && dcCurrent.currentText === "Block DC"){
            circuitImage.source = "images/pi_block.svg"
            qInputText.visible = true;
            lDisplayRec.visible = false;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = true;
        }
        else if(circuitType.currentText === "T Shaped Matching" && dcCurrent.currentText === "Feed DC"){
            circuitImage.source = "images/t_feed.svg"
            qInputText.visible = true;
            lDisplayRec.visible = false;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = true;
        }
        else if (circuitType.currentText === "T Shaped Matching" && dcCurrent.currentText === "Block DC"){
            circuitImage.source = "images/t_block.svg"
            qInputText.visible = true;
            lDisplayRec.visible = false;
            clcDisplayRec.visible = true;
            lclDisplayRec.visible = false;
        }
        else {
            circuitImage.source = "images/L_a.svg"
            qInputText.visible = false;
            lDisplayRec.visible = true;
            clcDisplayRec.visible = false;
            lclDisplayRec.visible = false;
        }
    }

    function roundNumber(number, decimalPlaces) {
        // Tính toán mũ của số
        let exponent = Math.floor(Math.log10(Math.abs(number)));
        // Tính toán hệ số làm tròn
        let coefficient = Math.pow(10, decimalPlaces - 1 - exponent);
        // Làm tròn số
        let roundedNumber = Math.round(number * coefficient) / coefficient;

        return roundedNumber;
    }

    SettingHandle {
        id: settingHandle

        // Connect signal to process settings
        onSettingsApplied: {
            // Handle settings data
            console.log("Minh reiceiver")
        }
    }

    Button {
        id: button
        width: 234
        height: 82
        text: qsTr("Press me")
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 401
        anchors.horizontalCenterOffset: -28
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: exportBtn
        width: 234
        height: 82
        text: qsTr("Export")
        anchors.verticalCenter: parent.verticalCenter
        checkable: true
        anchors.verticalCenterOffset: 401
        anchors.horizontalCenterOffset: -745
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        id: visua
        width: 234
        height: 82
        text: qsTr("Visualization")
        anchors.verticalCenter: parent.verticalCenter
        checkable: true
        anchors.verticalCenterOffset: 401
        anchors.horizontalCenterOffset: -388
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
