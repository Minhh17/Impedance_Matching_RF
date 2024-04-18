#ifndef L_TYPE_H
#define L_TYPE_H

#include <QObject>
#include <QVector>
#include <QDebug>

class l_type
{
public:
    l_type();
    QVector<double> lCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar,
                          double xlVar, double qVar);

};

#endif // L_TYPE_H
