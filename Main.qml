import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtMultimedia

Window {
    width: 720
    height: 480
    visible: true
    title: qsTr("Auto Maintenance")


    Rectangle {
        id: backgroundRectangle
        height: parent.height/2
        color: "#0e0121"
        border.width: 0
        width: parent.width
        anchors.top: parent.top
    }

    ColumnLayout {

        width: parent.width
        height: parent.height

        Text {
            id: headerTitle
            color: "#ffffff"
            text: qsTr("Auto Maintenance")
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter

            font.family: "Tahoma"
            font.styleName: "Bold"
            Layout.alignment: Qt.AlignHCenter
        }

        BasicCarInfo {
            id: basicCarInfo
        }

        RowLayout {
            id: row
            Layout.alignment: Qt.AlignHCenter
            width: parent.width * 3/4
            height: 20
            spacing: 25

            Button {
                id: button
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                width: 150  // Adjust the width according to your preference
                height: 40  // Adjust the height according to your preference
                text: qsTr("Video Tutorials")
                display: AbstractButton.TextOnly
                font.pointSize: 14
                onClicked: {
                    videoPop.open()
                }
            }

            Button {
                id: button1
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                width: 150
                height: 40
                text: qsTr("Service History")
                highlighted: true
                font.pointSize: 14
                display: AbstractButton.TextOnly
                onClicked: {
                    serviceHistory.open()
                }
            }

            Button {
                id: button2
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                width: 150
                height: 40
                text: qsTr("Parts")
                highlighted: true
                font.pointSize: 14
                display: AbstractButton.TextOnly
            }
            Button {
                id: button4
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                width: 150
                height: 40
                text: qsTr("Settings")
                highlighted: true
                font.pointSize: 14
                display: AbstractButton.TextOnly
            }
        }
    }

    VideoPopup {
        id: videoPop
    }

    ServiceHistory {
        id: serviceHistory
    }

}
