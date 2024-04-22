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

    double freqInHere = 2.0 * 3.14 * freqVar;

    // ------------------------------------------------------A Type-----------------------------------------------------------
    if (dcType == "Feed DC" && rsVar < rlVar) {
        qDebug()<< "Chon loai a";
        qValue = sqrt(rlVar / rsVar - 1);
        xsValue = qValue * rsVar;
        xpValue = rlVar / qValue;
        cValue = 1.0 / (2.0 * 3.14 * freqVar * xpValue);
        lValue = (xsValue / freqInHere) -    (xsVar / freqInHere);

        qDebug()<< "l1: " << xsValue / freqInHere;
        qDebug()<< "l2: " << xsVar / freqInHere;
        qDebug()<< "qValue: " << xpValue;
        qDebug()<< "lValue: " << lValue;
        qDebug()<< "cValue:" << cValue;

        result.append(cValue);
        result.append(lValue);
        result.append(qValue);
        // qDebug()<< result;
        return result;
    }
    //-----------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------B Type-----------------------------------------------------------
    else if (dcType == "Block DC" && rsVar < rlVar) {
        qDebug()<< "Chon loai b";
        qValue = sqrt(rlVar/rsVar - 1);
        xsValue = qValue * rsVar;
        xpValue = rlVar / qValue;

        lValue = xpValue / freqInHere;
        cValue = 1.0 / (freqInHere * (xsValue + xsVar));

        result.append(cValue);
        result.append(lValue);
        result.append(qValue);
        return result;
    }
    //-----------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------C Type-----------------------------------------------------------
    else if (dcType == "Feed DC" && rsVar > rlVar) {
        qDebug()<< "Chon loai c";

        double a2plusb2 = pow(rsVar, 2) + pow(xsVar, 2);
        qValue = sqrt( (a2plusb2 / (rsVar * rlVar) ) -1);
        double q2 = pow(qValue, 2);
        lValue = (qValue * rlVar) / freqInHere;
        cValue = ( xsVar / (freqInHere * a2plusb2) ) + ( 1 / ( pow(freqInHere, 2) * ( (q2+1)/q2 )  * lValue ) );

        result.append(cValue);
        result.append(lValue);
        result.append(qValue);
        // qDebug()<< result;
        return result;
    }
    //-----------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------D Type-----------------------------------------------------------
    else if (dcType == "Block DC" && rsVar > rlVar){
        qDebug()<< "Chon loai d";

        double a2plusb2 = pow(rsVar, 2) + pow(xsVar, 2);
        qValue = sqrt( (a2plusb2 / (rsVar * rlVar) ) -1);
        double q2 = pow(qValue, 2);
        cValue = 1.0 / (freqInHere * qValue * rlVar);
        lValue = - 1.0 / ( ( (xsVar*freqInHere) / a2plusb2 ) - ( pow(freqInHere, 2) * cValue * (q2/(q2 +1) ) ) );

        result.append(cValue);
        result.append(lValue);
        result.append(qValue);
        // qDebug()<< result;
        return result;
    }
    //-----------------------------------------------------------------------------------------------------------------------

    // else {
    //     qDebug()<< "Noone";
    // }
}
