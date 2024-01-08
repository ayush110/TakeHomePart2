#ifndef SERVICEHISTORY_H
#define SERVICEHISTORY_H
#include <QObject>
class ServiceHistory : public QObject
{
    Q_OBJECT

public:

    explicit ServiceHistory( QObject *parent = nullptr);

public slots:
    QStringList getHistory();

    QString getServiceDate();  // Method to return today's date

signals:
    void dateChanged();
};

#endif // SERVICEHISTORY_H
