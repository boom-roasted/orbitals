#ifndef PRIMARYBODY_H
#define PRIMARYBODY_H

#include "vector3.h"
#include <string>

class PrimaryBody
{
public:
  std::string name;
  Vector3 position;
  double mass;
  double radius;
  double Mu;

  PrimaryBody(
      const std::string& name,
      const Vector3& position,
      double mass,
      double radius,
      double Mu)
      : name(name), position(position), mass(mass), radius(radius), Mu(Mu)
  {
  }

  static PrimaryBody Earth()
  {
    double radiusEarth = 6371.0;                  // km
    double massEarth = 5.9722 * std::pow(10, 24); // kg
    double Mu = 398600;                           // Units?
    return PrimaryBody("Earth", Vector3::origin(), massEarth, radiusEarth, Mu);
  }

  inline bool operator==(const PrimaryBody& other)
  {
    return name == other.name && position == other.position &&
           mass == other.mass && radius == other.radius && Mu == other.Mu;
  }
};

#endif // PRIMARYBODY_H
