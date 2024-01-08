#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "VideoPopup.h"
#include <QQmlContext>
#include "servicehistory.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    VideoPopup *videoPopup = new VideoPopup(&app);
    qmlRegisterSingletonInstance("com.company.VideoController", 1, 0, "VideoController", videoPopup);

    ServiceHistory *serviceHistory = new ServiceHistory(&app);
    qmlRegisterSingletonInstance("com.company.ServiceHistory", 1, 0, "ServiceHistory", serviceHistory);


    const QUrl url(u"qrc:/Part2/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
