#include <iostream>

using namespace std;


class Vehicle
{
public:
    virtual void makeSound()
    {
        cout << "The vehicle makes a sound." << endl;
    }

    virtual ~Vehicle() = default;
};


class Car : public Vehicle
{
public:
    void makeSound() override
    {
        cout << "Car: Beep beep!" << endl;
    }
};


class Motorcycle : public Vehicle
{
public:
    void makeSound() override
    {
        cout << "Motorcycle: Vroom vroom!" << endl;
    }
};

int main()
{
    
    Car car1;
    Motorcycle motorcycle1;

    
    Vehicle* vehicle;

    
    vehicle = &car1;
    vehicle->makeSound();

    
    vehicle = &motorcycle1;
    vehicle->makeSound();

    return 0;
}