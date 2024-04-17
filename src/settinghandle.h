#ifndef SETTINGHANDLE_H
#define SETTINGHANDLE_H

#include <QObject>

class SettingHandle : public QObject
{
    Q_OBJECT
public:
    explicit SettingHandle(QObject *parent = nullptr);

signals:
    void settingsApplied(QString circuitType, QString dcType, QString frequency, QString freqUnit,
                         QString rs, QString rsUnit, QString xs, QString xsUnit,
                         QString rl, QString rlUnit, QString xl, QString xlUnit,
                         QString q);

public slots:
    void applySettings(QString circuitTypeVar, QString dcType, QString freqVar, QString freqUnitVar,
                       QString rsVar, QString rsUnitVar, QString xsVar, QString xsUnitVar,
                       QString rlVar, QString rlUnitVar, QString xlVar, QString xlUnitVar,
                       QString qVar);
};

#endif // SETTINGHANDLE_H

