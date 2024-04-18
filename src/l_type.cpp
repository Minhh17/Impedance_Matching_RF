#include "l_type.h"

l_type::l_type() {}

QVector<double> l_type::lCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar, double xlVar, double qVar)
{
    QVector<double> result;
    double xsValue;
    double xpValue;
    double cValue;
    double lValue;
    double qValue;

    if (dcType == "Feed DC" && rsVar < rlVar) {
        qValue = sqrt(rlVar/rsVar - 1);
        xsValue = qValue * rsVar;
        xpValue = rlVar / qValue;
        cValue = 1 / (2 * 3.14 * freqVar * xpValue);
        lValue = (xsValue/(2*3.14*freqVar)) + (xsVar/(2*3.14*freqVar));

        // qDebug()<< "l1: " << xsValue/(2*3.14*freqVar);
        // qDebug()<< "l2: " << xsVar/2*3.14*freqVar;
        // qDebug()<< "qValue: " << xpValue;
        // qDebug()<< "lValue: " << lValue;
        // qDebug()<< "cValue:" << cValue;

        result.append(cValue);
        result.append(lValue);
        result.append(qValue);

        qDebug()<< result;
        return result;

    }
    else if (dcType == "Feed DC" && rsVar > rlVar) {
        qDebug()<< "Chon loai b";
    }
    else if (dcType == "Block DC" && rsVar < rlVar) {
        qDebug()<< "Chon loai c";
    }
    else if (dcType == "Block DC" && rsVar > rlVar){
        qDebug()<< "Chon loai d";
    }
    else {
        qDebug()<< "Noone";
    }
}
