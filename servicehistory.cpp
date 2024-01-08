#include "servicehistory.h"
#include "qdatetime.h"
#include <QRandomGenerator>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>


ServiceHistory::ServiceHistory(QObject *parent) : QObject(parent) {
}
QStringList ServiceHistory::getHistory() {
    QStringList historyList;

    // Assuming your file is named history.json and is located in the assets folder
    QFile file("Part2/assets/data/history.json");  // Use the correct path and file name
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Failed to open file:" << file.errorString();
        return historyList;  // Return an empty list if file opening fails
    }

    QByteArray jsonData = file.readAll();
    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData);
    if (!jsonDoc.isArray()) {
        qDebug() << "Failed to parse JSON array.";
        return historyList;  // Return an empty list if JSON parsing fails
    }

    QJsonArray historyArray = jsonDoc.array();
    for (const QJsonValue& value : historyArray) {
        if (value.isObject()) {
            QJsonObject historyObject = value.toObject();

            // Check if the object has the required properties
            if (historyObject.contains("date") && historyObject.contains("event") && historyObject.contains("details")) {
                QString historyEntry = QString("%1 - %2: %3")
                                           .arg(historyObject["date"].toString())
                                           .arg(historyObject["event"].toString())
                                           .arg(historyObject["details"].toString());

                historyList.append(historyEntry);
            }
        }
    }

    return historyList;
}

QString ServiceHistory::getServiceDate()
{
    // Method to return random date as a string

    QDate currentDate = QDate::currentDate();
    int randomDays = QRandomGenerator::global()->bounded(365);  // Generate a random number of days (adjust as needed)
    QDate randomDate = currentDate.addDays(-randomDays);
    return randomDate.toString("dd MMM");
}
