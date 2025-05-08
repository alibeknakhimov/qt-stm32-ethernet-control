#ifndef MYLOGIC_H
#define MYLOGIC_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QList>

class MyLogic : public QObject
{
    Q_OBJECT
public:
    explicit MyLogic(QObject *parent = nullptr);
    Q_INVOKABLE void setValueFromSlider(QString value); // можно вызывать из QML, если надо

private slots:
    void handleNewConnection();
    void handleClientDisconnected();

private:
    QTcpServer *server;
    QList<QTcpSocket*> clients;
};

#endif // MYLOGIC_H
