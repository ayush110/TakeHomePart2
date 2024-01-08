// IconTextItem.qml

import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.settings

Item {
    property alias iconSource: icon.source  // Property alias for external use
    property alias text: text.text  // Property alias for external use
    property alias level: level.text  // Property alias for external use

    Layout.fillWidth: true // Adjust the width according to your design
    height: 80  // Adjust the height according to your design

    Image {
        id: icon
        width: 32  // Adjust the icon width
        height: 32  // Adjust the icon height
        source: iconSource
    }

    Text {
        id: level
        text: level
        color: "grey"  // Adjust the text color
        font.pixelSize: 20  // Adjust the font size
        horizontalAlignment: Text.AlignHCenter
        anchors {
            top: icon.bottom
        }
    }

    Text {
        id: text
        text: text
        color: "black"  // Adjust the text color
        font.pixelSize: 14  // Adjust the font size
        horizontalAlignment: Text.AlignHCenter
        anchors {
            top: level.bottom
        }
    }

}
