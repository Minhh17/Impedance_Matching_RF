#include "settinghandle.h"
#include <QDebug>

SettingHandle::SettingHandle(QObject *parent) : QObject(parent)
{

}

QVector<double> SettingHandle::applySettings(QString circuitTypeVar, QString dcType, double freqVar, QString freqUnitVar,
                                  double rsVar, QString rsUnitVar, double xsVar, QString xsUnitVar,
                                  double rlVar, QString rlUnitVar, double xlVar, QString xlUnitVar,
                                  double qVar)
{

    // L Shape Matching
    if(circuitTypeVar == "L Shaped Matching") {
        qDebug() << "Da nhan data 1 & Thuc thi 1";
        return LType.lCalc(dcType, freqVar, rsVar, xsVar, rlVar, xlVar, qVar);
    }

    // Pi shape Matching
    else if(circuitTypeVar == "Pi Shaped Matching") {
        qDebug() << "Da nhan data 2 & Thuc thi 2" ;
    }

    // T Shape Matching
    else if(circuitTypeVar == "T Shaped Matching") {
        qDebug() << "Da nhan data 3 & Thuc thi 3" ;
    }


    // Emit signal with settings data
    emit settingsApplied(circuitTypeVar, dcType, freqVar, freqUnitVar,
                         rsVar, rsUnitVar, xsVar, xsUnitVar,
                         rlVar, rlUnitVar, xlVar, xlUnitVar,
                         qVar);
}
