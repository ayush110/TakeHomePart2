import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia
import com.company.ServiceHistory

Dialog {
    id: serviceHistory

    width: parent.width * 3/4
    height: parent.height * 3/4
    anchors.centerIn: parent
    standardButtons: Dialog.Close
    modal: true
    closePolicy: Popup.CloseOnPressOutside

    ListView {
            width: parent.width
            height: parent.height

            model: ServiceHistory.getHistory()  // Use the C++ method to get the list of texts

            delegate: Item {
                width: parent.width
                height: 40

                Text {
                    anchors.centerIn: parent
                    text: modelData
                }
            }
        }
}
