#include <iostream>
#include <string>

using namespace std;


class Person
{
protected:
    string name;
    int age;

public:
    void setPersonDetails(string n, int a)
    {
        name = n;
        age = a;
    }

    void displayPersonDetails()
    {
        cout << "Name: " << name << endl;
        cout << "Age: " << age << endl;
    }
};


class Student : public Person
{
protected:
    string registrationNumber;

public:
    void setStudentDetails(string reg)
    {
        registrationNumber = reg;
    }

    void displayStudentDetails()
    {
        cout << "Registration Number: "
             << registrationNumber << endl;
    }
};


class EngineeringStudent : public Student
{
private:
    string specialization;

public:
    void setSpecialization(string s)
    {
        specialization = s;
    }

    void displayEngineeringDetails()
    {
        cout << "Specialization: "
             << specialization << endl;
    }
};

int main()
{
    
    EngineeringStudent student1;

    
    student1.setPersonDetails("Nesta", 22);
    student1.setStudentDetails("24/U/24151");
    student1.setSpecialization("Electrical Engineering");

    
    cout << "ENGINEERING STUDENT DETAILS" << endl;
    cout << "---------------------------" << endl;

    student1.displayPersonDetails();
    student1.displayStudentDetails();
    student1.displayEngineeringDetails();

    return 0;
}