/*Copyright (c) 2020 The Eriss-System Project Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/

#ifndef VECTOR3D_H
#define VECTOR3D_H

#include <math.h>
#include <Godot.hpp>

struct Vector3d
{
    double x = 0.0;
    double y = 0.0;
    double z = 0.0;

    Vector3d(){}
    
    Vector3d(double x_, double y_, double z_)
    {
        x=x_;
        y=y_;
        z=z_;
    }

    // Conversion 
    godot::Vector3 toVector3();

    // Geometrical Operations
    
    double distanceSquaredTo(const Vector3d& a);
    double distanceTo(const Vector3d& a);
    Vector3d& directionTo(const Vector3d& a);

    double length();
    double lengthSquared();
    Vector3d& normalized();

    // Basic Operations 
    Vector3d& operator+=(const Vector3d& rhs);   
    Vector3d& operator-=(const Vector3d& rhs);
    Vector3d& operator*=(double rhs);
    Vector3d& operator/=(double rhs);

    Vector3d operator*(double rhs);
    Vector3d operator/(double rhs);
};

Vector3d operator+(Vector3d lhs, const Vector3d& rhs);
Vector3d operator-(Vector3d lhs, const Vector3d& rhs);
Vector3d operator*(double lhs, const Vector3d& rhs);

#endif