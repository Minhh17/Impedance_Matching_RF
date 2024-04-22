#include "t_type.h"

t_type::t_type() {}

QVector<double> t_type::tCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar, double xlVar, double qVar)
{
    QVector<double> result;
    double xs1Value;
    double xs2Value;
    double xp1Value;
    double xp2Value;

    double freqInHere = 2.0 * 3.14 * freqVar;

    double initialGuess = findInitialGuess(rsVar, rlVar, qVar);
    double lowerBound = initialGuess - 10;
    double upperBound = initialGuess + 10;
    double tolerance = 0.001;

    double riValue = bisectionMethod(rsVar, rlVar, qVar, lowerBound, upperBound, tolerance);
    qDebug()<< "Ri: " << riValue;
    double q1Value = sqrt( (riValue/rsVar) - 1 );
    qDebug()<< "q1: " << q1Value;
    double q2Value = sqrt(riValue/rlVar - 1);
    qDebug()<< "q2: " << q2Value;

    xp1Value = riValue / q1Value ;
    xp2Value = riValue / q2Value;
    xs2Value = q2Value * rlVar;

    if (dcType == "Feed DC"){
        xs1Value = q1Value * rsVar - xsVar;
        double cValue = 1.0 / (xp1Value * freqInHere) + 1.0 / (xp2Value * freqInHere);
        double l1Value = xs1Value / freqInHere;
        double l2Value = xs2Value / freqInHere;

        result.append(l1Value);
        result.append(cValue);
        result.append(l2Value);

        return result;
    }
    else {
        xs1Value = q1Value * rsVar + xsVar;
        double lValue = (xp1Value+xp2Value) / freqInHere;
        double c1Value = 1.0 / (xs1Value * freqInHere);
        double c2Value = 1.0 / (xs2Value * freqInHere);

        result.append(c1Value);
        result.append(lValue);
        result.append(c2Value);

        return result;
    }
}

double t_type::equation(double Ri, double Rs, double RL, double Q) {
    return sqrt((Ri - Rs) / Rs) + sqrt((Ri - RL) / RL) - Q;
}

double t_type::findInitialGuess(double Rs, double RL, double Q) {
    // Chọn điểm bắt đầu
    double initialGuess = qMax(Rs, RL); // Bắt đầu từ 0.1
    double stepSize = 10;

    // Kiểm tra dấu của hàm tại các điểm và tìm khoảng nghiệm
    while (equation(initialGuess, Rs, RL, Q) * equation(initialGuess + stepSize, Rs, RL, Q) > 0) {
        initialGuess += stepSize;
    }
    return initialGuess;
}

double t_type::bisectionMethod(double Rs, double RL, double Q, double a, double b, double tolerance) {
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

