#include "settinghandle.h"
#include <QDebug>

SettingHandle::SettingHandle(QObject *parent) : QObject(parent)
{

}

void SettingHandle::applySettings(QString circuitTypeVar, QString dcType, QString freqVar, QString freqUnitVar,
                                    QString rsVar, QString rsUnitVar, QString xsVar, QString xsUnitVar,
                                    QString rlVar, QString rlUnitVar, QString xlVar, QString xlUnitVar,
                                    QString qVar)
{

    qDebug() << "Da nhan data" << circuitTypeVar;
    // Emit signal with settings data
    emit settingsApplied(circuitTypeVar, dcType, freqVar, freqUnitVar,
                         rsVar, rsUnitVar, xsVar, xsUnitVar,
                         rlVar, rlUnitVar, xlVar, xlUnitVar,
                         qVar);
}
