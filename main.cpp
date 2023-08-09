#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "cropper.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Cropper>("Widgets",1,0,"Cropper");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Cropper/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
