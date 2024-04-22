#ifndef PI_TYPE_H
#define PI_TYPE_H

#include <QObject>
#include <QVector>
#include <QDebug>
#include <QCoreApplication>
#include <iostream>
#include <cmath>

using namespace std;

class pi_type
{
public:
    pi_type();
    QVector<double> piCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar,
                           double xlVar, double qVar);

    double equation(double Ri, double Rs, double RL, double Q);
    double findInitialGuess(double Rs, double RL, double Q);
    double bisectionMethod(double Rs, double RL, double Q, double a, double b, double tolerance);

};

#endif // PI_TYPE_H
