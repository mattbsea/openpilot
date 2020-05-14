#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QSharedMemory>

#include <zmq.h>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QSharedMemory m("gpsLocation");

    qDebug() << "Attach: " << m.attach();



//    Context *c = Context::create();

//    SubSocket *model = SubSocket::create(c, "model");
//    SubSocket *thermal = SubSocket::create(c, "thermal");

//    Poller *poller = Poller::create({model, thermal});

//    while(true) {
//        auto polls = poller->poll(0);

//        for (auto sock : polls) {
//            Message *msg = sock->receive();
//            if (msg == NULL) continue;
//        }
//    }

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
