import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
Window {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Example Window")
    property bool bt1: false
    property bool bt2: false
    property bool bt3: false
    Rectangle {
        id: rectangle
        width: 1920
        height: 1080
        color: "#18181b"

        Column {
            id: column
            anchors.fill: parent
            anchors.margins: 20 // Можно регулировать только здесь
            spacing: 40

            Row {
                id: row
                height: 100

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Lab Control System")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 35
                }
            }

            Column {
                id: column1
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width

                Text {
                    id: text2
                    text: qsTr("Water Pump")
                    font.pixelSize: 28
                    color: "white"
                }

                RowLayout {
                    id: row2
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 60
                    spacing: 20

                    Button {
                        id: button
                        Layout.fillWidth: true
                        height: 60
                        text: qsTr("ON")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        background: Rectangle {
                            color: {
                            if(bt1 == true){
                                if(!button.hovered)
                                    "#00ff18"
                                else
                                    "darkgreen"
                                }
                            else if(bt1 == false){
                                if(!button.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }

                            radius: 6
                            anchors.fill: parent
                        }

                        onClicked: {
                            logic.setValueFromSlider("B1:1");
                            bt1 = true;
                        }
                    }

                    Button {
                        id: button1
                        Layout.fillWidth: true
                        height: 60
                        text: qsTr("OFF")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        background: Rectangle {
                            color: {
                            if(bt1 == false){
                                if(!button1.hovered)
                                    "#ff0000"
                                else
                                    "darkred"
                                }
                            else if(bt1 == true){
                                if(!button1.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }
                            radius: 6
                            anchors.fill: parent
                        }

                        onClicked: {
                            logic.setValueFromSlider("B1:0");
                            bt1 = false;
                        }
                    }
                }
            }

            Column {
                id: column2
                width: parent.width
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    color: "#ffffff"
                    text: qsTr("Electric Lock")
                    font.pixelSize: 28
                }

                RowLayout {
                    width: parent.width
                    height: 60
                    spacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    Button {
                        id: button2
                        height: 60
                        text: qsTr("ON")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: {
                            if(bt2 == true){
                                if(!button2.hovered)
                                    "#00ff18"
                                else
                                    "darkgreen"
                                }
                            else if(bt2 == false){
                                if(!button2.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }
                            radius: 6
                            anchors.fill: parent
                        }
                        onClicked: {
                            logic.setValueFromSlider("B2:1")
                            bt2 = true;
                        }
                    }

                    Button {
                        id: button3
                        height: 60
                        text: qsTr("OFF")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: {
                            if(bt2 == false){
                                if(!button3.hovered)
                                    "#ff0000"
                                else
                                    "darkred"
                                }
                            else if(bt2 == true){
                                if(!button3.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }
                            radius: 6
                            anchors.fill: parent
                        }
                        onClicked: {
                            logic.setValueFromSlider("B2:0")
                            bt2 = false;
                        }
                    }
                }
            }

            Column {
                id: column3
                width: parent.width
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    color: "#ffffff"
                    text: qsTr("Fan")
                    font.pixelSize: 28
                }

                RowLayout {
                    width: parent.width
                    height: 60
                    spacing: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    Button {
                        id: button4
                        height: 60
                        text: qsTr("ON")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: {
                            if(bt3 == true){
                                if(!button4.hovered)
                                    "#00ff18"
                                else
                                    "darkgreen"
                                }
                            else if(bt3 == false){
                                if(!button4.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }
                            radius: 6
                            anchors.fill: parent
                        }
                        onClicked: {
                            logic.setValueFromSlider("B3:1")
                            bt3 = true;
                        }
                    }

                    Button {
                        id: button5
                        height: 60
                        text: qsTr("OFF")
                        font.pointSize: 11
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        background: Rectangle {
                            color: {
                            if(bt3 == false){
                                if(!button5.hovered)
                                    "#ff0000"
                                else
                                    "darkred"
                                }
                            else if(bt3 == true){
                                if(!button5.hovered)
                                    "gray"
                                else
                                    "#525252"
                                }
                        }
                            radius: 6
                            anchors.fill: parent
                        }
                        onClicked: {
                            logic.setValueFromSlider("B3:0")
                            bt3 = false;
                        }
                    }
                }
            }

            ColumnLayout {
                id: columnLayout
                width: parent.width
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                RowLayout {
                    id: rowLayout1
                    width: 100
                    height: 100
                    spacing: 1650
                    Layout.fillWidth: true

                    Text {
                        color: "#ffffff"
                        text: qsTr("LED Brightness")
                        font.pixelSize: 28
                    }

                    Text {
                        id: text6
                        color: "#737373"
                        text: (slider.value * 100).toFixed(0) + "%"
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    }
                }
                Slider {
                    id: slider
                    stepSize: 0.01
                    Layout.fillWidth: true
                    value: 0.5
                    background: Rectangle {
                        id: track
                        anchors.fill: parent
                        radius: height / 2
                        color: "#333333" // ← цвет незаполненной части
                    }

                    contentItem: Item {
                        anchors.fill: parent

                        Rectangle {
                            id: fill
                            height: parent.height
                            width: parent.width * slider.position
                            radius: height / 2
                            color: "#ffffff" // ← цвет заполненной части
                        }
                    }
                    handle: Rectangle {
                        width: 20
                        height: 20
                        radius: 10
                        color: "white"
                        border.color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                        x: slider.position * (parent.width - width)
                    }
                    onValueChanged: {
                        var text = value.toFixed(2);
                        logic.setValueFromSlider("S1:"+text)
                    }
                }

                RowLayout {
                    id: rowLayout
                    width: 100
                    height: 100
                    Layout.fillWidth: true
                    spacing: 877

                    Text {
                        id: text3
                        color: "#737373"
                        text: qsTr("0%")
                        font.pixelSize: 20
                    }

                    Text {
                        id: text4
                        color: "#737373"
                        text: qsTr("50%")
                        font.pixelSize: 20
                    }

                    Text {
                        id: text5
                        color: "#737373"
                        text: qsTr("100%")
                        font.pixelSize: 20
                    }
                }
            }
        }
    }


}
