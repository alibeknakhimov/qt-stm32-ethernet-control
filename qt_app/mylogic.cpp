#include "mylogic.h"
#include <QDebug>

MyLogic::MyLogic(QObject *parent) : QObject(parent)
{
    server = new QTcpServer(this);

    connect(server, &QTcpServer::newConnection, this, &MyLogic::handleNewConnection);

    if (!server->listen(QHostAddress::Any, 2000)) {
        qDebug() << "Server failed to start:" << server->errorString();
    } else {
        qDebug() << "TCP Server listening on port" << server->serverPort();
    }
}

void MyLogic::handleNewConnection()
{
    while (server->hasPendingConnections()) {
        QTcpSocket *client = server->nextPendingConnection();
        clients.append(client);
        qDebug() << "Client connected:" << client->peerAddress().toString();

        connect(client, &QTcpSocket::disconnected, this, &MyLogic::handleClientDisconnected);
    }
}

void MyLogic::handleClientDisconnected()
{
    QTcpSocket *client = qobject_cast<QTcpSocket*>(sender());
    if (client) {
        clients.removeAll(client);
        client->deleteLater();
        qDebug() << "Client disconnected";
    }
}

void MyLogic::setValueFromSlider(QString value)
{
    QString message = value + "\n";
    QByteArray data = message.toUtf8();

    for (int i = 0; i < clients.size(); ++i) {
        QTcpSocket *client = clients.at(i);
        if (client->state() == QAbstractSocket::ConnectedState) {
            client->write(data);
        }
    }

}
