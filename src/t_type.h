#ifndef T_TYPE_H
#define T_TYPE_H

#include <QObject>
#include <QVector>
#include <QDebug>
#include <QCoreApplication>
#include <iostream>
#include <cmath>

class t_type
{
public:
    t_type();
    QVector<double> tCalc(QString dcType, double freqVar, double rsVar, double xsVar, double rlVar,
                          double xlVar, double qVar);
    double equation(double Ri, double Rs, double RL, double Q);
    double findInitialGuess(double Rs, double RL, double Q);
    double bisectionMethod(double Rs, double RL, double Q, double a, double b, double tolerance);
};

#endif // T_TYPE_H
