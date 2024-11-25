import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

Window {

    visible: true
    width: 480
    height: 800
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width
    title: qsTr("WorkUp")
    property double tc: 0
    property double tccomp: 0
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: startScr
    }
    StartScreen {
        Timer {
                interval: 6000; running: true; repeat: false
                onTriggered: stackView.push(mainMenu)
            }
        id: startScr
        background: Rectangle{
            id: bgrect
            color: "#072b52"
            ColorAnimation on color {
                from: "#072b52"
                to: "#a9cff8"
                duration: 2000
                easing.type: Easing.InOutSine
            }
        }


        Image {
            id: mountainsPng
            x: -146
            y: 798
            width: 772
            height: 468
            opacity: 1
            fillMode: Image.Stretch
            source: "Images/178-1787361_cartoon-drawing-illustration-cartoon-mountain.png"
        }




        Text {
            id: name4
            x: 76
            y: 332
            text: qsTr("WorkUp")
            font.family: "Kaph"
            font.pixelSize: 60
        }


        Text {
            id: name3
            x: 76
            y: 322
            color: "#7d3f13"
            text: qsTr("WorkUp")
            font.family: "Kaph"
            font.pixelSize: 60
        }

        Text {
            id: name2
            x: 76
            y: 312
            color: "#e87c30"
            text: qsTr("WorkUp")
            font.family: "Kaph"
            font.pixelSize: 60
        }

        Image {
            id: sunpng
            x: 138
            y: 42
            width: 204
            height: 192
            fillMode: Image.PreserveAspectFit
            source: "Images/1626661061_preview_sun.png"
        }

            ParallelAnimation{
                running: true
                NumberAnimation{
                    targets: name2
                    property: "y"
                    from: 290
                    to: 310
                    duration: 2000
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    targets: name2
                    property: "scale"
                    from: 0
                    to: 1.2
                    duration: 2000
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    targets: name3
                    property: "y"
                    from: 295
                    to: 320
                    duration: 2150
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    targets: name3
                    property: "scale"
                    from: 0
                    to: 1.15
                    duration: 2150
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    targets: name4
                    property: "y"
                    from: 300
                    to: 330
                    duration: 2300
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    targets: name4
                    property: "scale"
                    from: 0
                    to: 1.1
                    duration: 2300
                    easing.type: Easing.InOutSine
                }
                NumberAnimation{
                    target: sunpng
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 2500
                    easing.type: Easing.InOutBack

                }
                NumberAnimation{
                    target: sunpng
                    property: "rotation"
                    from: 0
                    to: 360
                    duration: 3000

                    easing.type: Easing.InOutBack

                }
                NumberAnimation{
                    target: mountainsPng
                    property: "y"
                    from: 800
                    to: 500
                    duration: 4000
                    easing.type: Easing.InOutBack
                }

    }
            AnimatedImage {
                id: loadGif
                x: 209
                y: 745
                width: 62
                height: 47
                source: "Images/Animation - 1732552377190.gif"
            }


}
    MainScreen {
        id: mainMenu
        visible: false
        ListModel{
            id: todoModel

        }

        Rectangle {
            id: rectangle
            x: 0
            y: -6
            width: 480
            height: 800
            color: "#1c1b1b"

            ProgressBar {
                id: progressBar
                x: 13
                y: 120
                width: 451
                height: 9
                wheelEnabled: false
                indeterminate: false
                value: 0
            }

            Text {
                id: appName
                x: 13
                y: 14
                width: 119
                height: 38
                color: "#ffffff"
                text: qsTr("WorkUP")
                font.family: "Courier"
                font.pixelSize: 30
            }

            ToolBar {
                id: toolBar
                x: 13
                y: 52
                width: 451
                height: 62
                background: Rectangle{
                    color: "darkblue"
                    radius: 20
                }
            }

            ListView {
                id: listView1
                x: 33
                y: 185
                width: 420
                height: 157
                model: todoModel
                spacing: 10
                delegate: Rectangle {
                    id: dlg
                    x: 5
                    radius: 10
                    width: parent.width
                    height: 40

                    property string title
                    property string description

                    title: _title
                    description: _des

                    Column{
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        topPadding: 5

                        Text {
                            text: dlg.title
                            anchors.centerIn: parent
                            font.pixelSize: 15
                            font.family: "Courier"

                        }
                        Text {
                            id: descrip
                            text: dlg.description
                            font.pixelSize: 12
                            font.family: "Courier"
                            visible: false
                        }

                        CheckBox{
                            rightPadding: 10
                            width: 20
                            height: 20
                            onCheckStateChanged: {
                                tccomp = tccomp-1+2*checked
                                console.log(tccomp)
                                progressBar.value = tccomp/tc
                            }

                        }


                        MouseArea {
                            anchors.fill: parent
                            anchors.leftMargin: 30
                            onClicked: {
                                console.log(dlg.description)
                                scrText.text = dlg.description
                            }
                        }
                    }

                }

            }

            ScrollView {
                background: Rectangle{
                    color: "#808080"
                    radius: 10
                }
                id: scrollView
                x: 13
                y: 400
                width: 451
                height: 274
                clip: true
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                Text {
                    id: scrText
                    leftPadding: 10
                    rightPadding: 10
                    topPadding: 10
                    font.family: "Courier"
                    font.pixelSize: 15
                    font.bold: true
                    text: "textbjdfhbjdbfjdgdbfjgbdfhgbjdfhgbfgjdfjgbdjfbgdjfgbdhfgjdbfjgbjdbfhgbjdbgbdjfgbdjfhgbdjfgbdjfhbgdhbgjdbgjdgdhbgjdb"
                    color: "white"

                }
            }
        }

        Rectangle {
            x: -5
            y: 9
            width: 112
            height: 50
            color: "#020257"
            radius: 20
            anchors.verticalCenterOffset: 333
            anchors.centerIn: parent
            Text {
                id: text2
                color: "#ffffff"
                text: qsTr("Settings")
                anchors.centerIn: parent
            }

            Button {
                opacity: 0
                anchors.fill: parent
                onClicked: {
                    stackView.push(settings)
                }
            }

            anchors.horizontalCenterOffset: 163
        }

        Text {
            id: usernm
            x: 53
            y: 770
            width: 145
            height: 14
            color: "#ffffff"
            text: qsTr("Username")
            horizontalAlignment: Text.AlignHCenter
            font.underline: true
            font.family: "Courier"
            font.pixelSize: 12
        }

        Rectangle{
            height: 50
            width: 200
            anchors.centerIn: parent;
            radius: 20
            anchors.verticalCenterOffset: 333
            anchors.horizontalCenterOffset: -114
            color: "darkblue"
            Text {
                id: text1
                text: qsTr("Create Task")
                anchors.centerIn: parent
                color: "white"
            }

            Button{
                anchors.fill: parent
                onClicked:
                {

                    stackView.push(newTaskCreate)
                }
                opacity: 0
            }
        }
    }
    NewTaskCreate{

        id: newTaskCreate
        visible: false
        Rectangle {
            id: bgnt
            x: 0
            y: 0
            width: 480
            height: 800
            color: "#1c1b1b"

            TextField {

                id: taskName
                x: 24
                y: 141
                width: 432
                height: 40
                font.family: "Courier"
                visible: true
                transformOrigin: Item.Center
                placeholderText: qsTr("Task Name")
            }

            ComboBox {
                id: comboBox
                x: 316
                y: 99
                width: 140
                height: 30
                model: ListModel{
                    ListElement{
                        text: "Срочное"
                    }
                    ListElement{
                        text: "Учеба"
                    }
                    ListElement{
                        text: "Работа"
                    }
                    ListElement{
                        text: "Прочее"
                    }
                }
            }

            Text {
                id: category
                x: 214
                y: 103
                color: "#ffffff"
                text: qsTr("CATEGORY")
                font.family: "Courier"
                font.pixelSize: 20
            }

            Text {
                id: element1
                x: 24
                y: 33
                width: 432
                height: 60
                color: "#ffffff"
                text: qsTr("NEW TASK")
                horizontalAlignment: Text.AlignRight
                font.family: "Courier"
                fontSizeMode: Text.HorizontalFit
                textFormat: Text.AutoText
                font.pixelSize: 50
            }
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
                id: textCancelCreate
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

        Rectangle{
            height: 50
            width: 200
            anchors.centerIn: parent;
            radius: 20
            anchors.verticalCenterOffset: 333
            anchors.horizontalCenterOffset: 115
            color: "darkgreen"
            Text {
                id: textAcceptCreate
                text: qsTr("Accept")
                font.pointSize: 15
                font.family: "Courier"
                anchors.centerIn: parent
                color: "white"
            }

            Button{
                anchors.fill: parent
                onClicked:
                {
                    tc = tc + 1
                    console.log(tc)
                    todoModel.append({"_title": taskName.text,"_des": taskDescr.text})
                    stackView.pop()

                    taskName.text = " "
                    taskDescr.text = " "

                }
                opacity: 0
            }
        }

        Rectangle {
            id: rectangle1
            x: 26
            y: 211
            anchors.fill: parent
            color: "#ffffff"
            radius: 20
            anchors.rightMargin: 25
            anchors.bottomMargin: 118
            anchors.leftMargin: 26
            anchors.topMargin: 198

            TextEdit {
                id: taskDescr
                x: 26
                y: 211
                anchors.fill: parent
                color: "#000000"
                text: qsTr("")
                font.family: "Courier"
                anchors.rightMargin: 16
                anchors.bottomMargin: 26
                anchors.leftMargin: 15
                anchors.topMargin: 14
                selectionColor: "#e9a2ee"
                font.pixelSize: 12
            }
        }
    }
    Settings{
        id: settings
        visible: false
    }
}

/*##^##
Designer {
    D{i:8;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}D{i:10;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}
D{i:11;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}D{i:18;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}
D{i:9;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}D{i:21;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}
D{i:23;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}D{i:22;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}
D{i:20;anchors_height:166;anchors_width:166;anchors_x:157;anchors_y:194}
}
##^##*/
