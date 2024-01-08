import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtMultimedia
import Qt.labs.settings
import com.company.ServiceHistory

Rectangle {
    id: basicCarInfo
    width: parent.width * 3/4
    height: parent.height / 3
    color: "white"
    radius: 20
    border.width: 0
    Layout.alignment: Qt.AlignHCenter

    // Adding a shadow
    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowBlur: 1.5
    }

    RowLayout {
        id: rowInfo
        width: parent.width
        height: parent.height

        Image {
            source: "assets/images/car-image.png"
            width: parent.width / 3
            height: parent.height  // Adjust the height as needed
            smooth: true  // Optional for smoother image rendering
            sourceSize.width: parent.width / 3  // Ensure the source image size matches the desired width
            sourceSize.height: parent.height  // Ensure the source image size matches the desired height
            clip: true  // Clip the image to the specified size
        }

        ColumnLayout {


            Text {
                id: name
                color: "#000000"
                text: qsTr("Welcome, Ayush")
                font.pixelSize: 20
                font.family: "Tahoma"
                font.styleName: "Bold"

            }

            Text {
                id: hr
                color: "#000000"
                text: qsTr("Lamborghini Huracan LP610")
                font.pixelSize: 14
                font.family: "Tahoma"
                font.styleName: "Bold"

            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 2  // Adjust the spacing between icons and text

                IconTextItem {
                    iconSource: "assets/images/battery.png"
                    level: "46%"
                    text: "Battery"
                }

                IconTextItem {
                    iconSource: "assets/images/temperature.png"
                    level: "115 C"
                    text: "Coolant"
                }

                IconTextItem {
                    iconSource: "assets/images/5080477.png"
                    level: "Eco"
                    text: "Mode"
                }


            }
        }

        Rectangle {
            width: 100
            height: parent.height
            color: "orange"
            // Specify individual radii for top right and bottom right corners
            radius: 20
            Layout.alignment: parent.right
            clip: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Update the displayed date when the text is clicked
                    dateText.text = ServiceHistory.getServiceDate();
                }
            }

            ColumnLayout {
                width: 100
                anchors.centerIn: parent
                Layout.alignment: Qt.AlignHCenter // Center the ColumnLayout horizontally

                Text {
                    id: dateText
                    font.pixelSize: 24
                    color: "black"
                    text: ServiceHistory.getServiceDate()
                    horizontalAlignment: Text.AlignHCenter
                }



            Text {
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
                color: "black"
                text: "Scheduled"
            }

            Text {
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
                color: "black"
                text: "Service"
            }
        }
    }
}
}

