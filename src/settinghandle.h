#ifndef SETTINGHANDLE_H
#define SETTINGHANDLE_H

#include <QObject>
#include "l_type.h"
#include "pi_type.h"
#include "t_type.h"

class SettingHandle : public QObject
{
    Q_OBJECT
public:
    explicit SettingHandle(QObject *parent = nullptr);

private:
    l_type LType;
    pi_type PiType;
    t_type TType;

signals:
    void settingsApplied(QString circuitType, QString dcType, double frequency, QString freqUnit,
                         double rs, QString rsUnit, double xs, QString xsUnit,
                         double rl, QString rlUnit, double xl, QString xlUnit,
                         double q);

public slots:
    QVector<double> applySettings(QString circuitTypeVar, QString dcType, double freqVar, QString freqUnitVar,
                       double rsVar, QString rsUnitVar, double xsVar, QString xsUnitVar,
                       double rlVar, QString rlUnitVar, double xlVar, QString xlUnitVar,
                       double qVar);
};

#endif // SETTINGHANDLE_H

