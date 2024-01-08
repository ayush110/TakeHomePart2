// videopopup.cpp

#include "videopopup.h"

VideoPopup::VideoPopup(QObject *parent) : QObject(parent) {
}

bool VideoPopup::playing() const {
    return m_playing;
}

void VideoPopup::playPause() {
    // Toggle the playing state
    m_playing = !m_playing;

    // Notify listeners that the playing state has changed
    emit playingChanged();
}
