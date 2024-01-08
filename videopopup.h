#ifndef VIDEOPOPUP_H
#define VIDEOPOPUP_H

#include <QObject>
#include <QMediaPlayer>

class VideoPopup : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged)
public:
    explicit VideoPopup(QObject *parent = nullptr);

    bool playing() const;

public slots:
    void playPause();

signals:
    void playingChanged();

private:
    bool m_playing = false;
};

#endif // VIDEOPOPUP_H
