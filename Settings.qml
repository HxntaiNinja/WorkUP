import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Page{
    width: 480
    height: 800
    background: Rectangle{
        color: "#1c1b1b"
    }


    Text {
        id: element
        x: 144
        y: 29
        color: "#ffffff"
        text: qsTr("SETTINGS")
        font.family: "Courier"
        font.pixelSize: 40
    }

    TextField {
        id: textField
        x: 140
        y: 87
        placeholderText: qsTr("Username")
    }

    ComboBox {
        id: comboBox
        x: 140
        y: 159
        width: 200
        height: 40
        textRole: "Categories"
    }

    Button {
        id: button
        x: 355
        y: 87
        width: 43
        height: 40
        text: qsTr("ok")
    }

    Text {
        id: element1
        x: 140
        y: 205
        color: "#9714cd"
        text: qsTr("Create Category")
        font.family: "Courier"
        font.underline: true
        font.pixelSize: 12
        Button{
            opacity: 0
        }
    }

    ComboBox {
        id: comboBox1
        x: 140
        y: 235
        width: 200
        height: 40
    }

    TextEdit {
        id: textEdit
        x: 140
        y: 281
        width: 80
        height: 20
        color: "#a108bc"
        text: qsTr("Create Status")
        font.underline: true
        font.family: "Courier"
        selectionColor: "#9c25da"
        font.pixelSize: 12
    }

    Button {
        id: button1
        x: 143
        y: 307
        width: 197
        height: 40
        text: qsTr("Delete All Tasks")
    }

    Rectangle{
        height: 50
        width: 200
        anchors.centerIn: parent;
        radius: 20
        anchors.verticalCenterOffset: 333
        anchors.horizontalCenterOffset: -114
        color: "darkred"
        Text {
            id: textSettings
            text: qsTr("Cancel")
            font.family: "Courier"
            font.pointSize: 15
            anchors.centerIn: parent
            color: "white"
        }
        Button{
            anchors.fill: parent
            onClicked:
            {
                stackView.pop()
            }
            opacity: 0
        }
    }

}
