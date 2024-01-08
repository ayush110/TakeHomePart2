// VideoPopup.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia
import com.company.VideoController

Dialog {
    id: videoPopup

    width: parent.width * 3/4
    height: parent.height * 3/4
    anchors.centerIn: parent
    standardButtons: Dialog.Close
    modal: true
    closePolicy: Popup.CloseOnPressOutside
    onClosed: {
        VideoController.playPause()
    }
    property string label: "assets/videos/car-video.avi"

        MediaPlayer {
            id: mediaPlayer
            source: "assets/videos/car-video2.mp4"
            videoOutput: videoOutput// Use a supported video format
            audioOutput: AudioOutput {
                id: audio
            }
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {VideoController.playPause()}
            Connections {
                target: VideoController
                 function onPlayingChanged() {
                    // This block will be executed whenever the playingChanged signal is emitted
                    if (VideoController.playing) {
                        // Handle the case when the video is playing
                        mediaPlayer.play()
                        console.log("Video is now playing.");
                    } else {
                        mediaPlayer.stop()
                        // Handle the case when the video is paused
                        console.log("Video is now paused.");
                    }
                }
            }

    }
}
