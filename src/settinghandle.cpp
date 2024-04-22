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
    //"GHz", "MHz", "Hz"
    if (freqUnitVar == "GHz"){
        freqVar = freqVar *1000000000;
    }
    else if (freqUnitVar == "MHz"){
        freqVar = freqVar *1000000;
    }

    // L Shape Matching
    if(circuitTypeVar == "L Shaped Matching") {        
        return LType.lCalc(dcType, freqVar, rsVar, xsVar, rlVar, xlVar, qVar);
    }

    // Pi shape Matching
    else if(circuitTypeVar == "Pi Shaped Matching") {
        qDebug() << "Da nhan data pi & Thuc thi pi" ;
        return PiType.piCalc(dcType, freqVar, rsVar, xsVar, rlVar, xlVar, qVar);
    }

    // T Shape Matching
    else if(circuitTypeVar == "T Shaped Matching") {
        qDebug() << "Da nhan data t & Thuc thi t" ;
        return TType.tCalc(dcType, freqVar, rsVar, xsVar, rlVar, xlVar, qVar);
    }

    // Emit signal with settings data
    emit settingsApplied(circuitTypeVar, dcType, freqVar, freqUnitVar,
                         rsVar, rsUnitVar, xsVar, xsUnitVar,
                         rlVar, rlUnitVar, xlVar, xlUnitVar,
                         qVar);
}
