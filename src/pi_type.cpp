#include "pi_type.h"

pi_type::pi_type() {}

QVector<double> pi_type::piCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar, double xlVar, double qVar)
{
    QVector<double> result;
    double xs1Value;
    double xs2Value;

    double xp1Value;
    double xp2Value;

    double freqInHere = 2.0 * 3.14 * freqVar;

    double initialGuess = findInitialGuess(rsVar, rlVar, qVar);
    double lowerBound = initialGuess - 0.1;
    double upperBound = initialGuess + 0.1;
    double tolerance = 0.0000001;

    double riValue = bisectionMethod(rsVar, rlVar, qVar, lowerBound, upperBound, tolerance);
    qDebug()<< "Ri: " << riValue;
    double q1Value = sqrt( (rsVar/riValue) - 1 + ( pow(xsVar,2) / (rsVar*riValue) ) );
    qDebug()<< "q1: " << q1Value;
    double q2Value = sqrt(rlVar/riValue - 1);
    qDebug()<< "q2: " << q2Value;

    xs1Value = q1Value * riValue;
    xs2Value = q2Value * riValue;


    xp2Value = rlVar / q2Value;
    qDebug()<< "xp2Value: " << xp2Value;
    // qDebug()<< "mau: " << xsVar / (pow(rsVar,2)+pow(xsVar,2)) << "mau2: " <<1/ xs1Value;

    if (dcType == "Feed DC"){
        xp1Value = 1.0 / ( (- xsVar / (pow(rsVar,2)+pow(xsVar,2)) + 1 / xs1Value) );
        double lValue = (xs1Value+xs2Value) / freqInHere;
        double c1Value = ( 1.0 / (xp1Value * freqInHere) ) * ( pow(q1Value,2) / (pow(q1Value,2)+1) );
        double c2Value = 1.0 / (xp2Value * freqInHere);

        result.append(c1Value);
        result.append(lValue);
        result.append(c2Value);

        return result;
    }
    else {
        qDebug()<< "Pi Block";
        xp1Value = 1.0 / ( (xsVar / (pow(rsVar,2)+pow(xsVar,2)) + 1 / xs1Value) );
        qDebug()<< "xp1Value: " << xp1Value;
        double cValue = 1.0 / ( (xs1Value+xs2Value) * freqInHere);
        double l1Value = ( xp1Value / freqInHere ) * ( (pow(q1Value,2)+1) / pow(q1Value,2) );
        double l2Value = xp2Value / freqInHere;

        result.append(l1Value);
        result.append(cValue);
        result.append(l2Value);
        return result;
    }
}

double pi_type::equation(double Ri, double Rs, double RL, double Q) {
    return sqrt((Rs - Ri) / Ri) + sqrt((RL - Ri) / Ri) - Q;
}

double pi_type::findInitialGuess(double Rs, double RL, double Q) {
    // Chọn điểm bắt đầu
    double initialGuess = 0.1; // Bắt đầu từ 0.1
    double stepSize = 0.1;

    // Kiểm tra dấu của hàm tại các điểm và tìm khoảng nghiệm
    while (equation(initialGuess, Rs, RL, Q) * equation(initialGuess + stepSize, Rs, RL, Q) > 0) {
        initialGuess += stepSize;
    }

    return initialGuess;
}

double pi_type::bisectionMethod(double Rs, double RL, double Q, double a, double b, double tolerance) {
    if (equation(a, Rs, RL, Q) * equation(b, Rs, RL, Q) >= 0) {
        std::cout << "Không có nghiệm trong khoảng đã cho" << std::endl;
        return -1;
    }
    while ((b - a) >= tolerance) {
        double c = (a + b) / 2;

        if (equation(c, Rs, RL, Q) == 0.0)
            return c;
        else if (equation(c, Rs, RL, Q) * equation(a, Rs, RL, Q) < 0)
            b = c;
        else
            a = c;
    }
    return (a + b) / 2;
}



