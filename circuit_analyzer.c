#include <stdio.h>

/* Function prototype */
double
 calculate_equivalent_resistance(double R1, double R2, int type);
 double calculate_current(double V, double Req);
  const char* get_status(double I);

  int main() {
    double R1, R2, V;
    int connnection_type;

    scanf("%lf", &R1);
    scanf("%lf", &R2);
    scanf("%d", &connnection_type);
    scanf("%lf", &V);

    double Req = calculate_equivalent_resistance(R1, R2, connnection_type);
    if (Req == -1) {
      printf("Invalid connection type.\n");
      return 0;
    }

    double I = calculate_current(V, Req);
        const char* status = get_status(I);
    printf("Equivalent Resistance: %.2f ohms\n", Req);
    printf("Current: %.2f A\n", I);
    printf("Status: %s\n", status);

    return 0;
  }
  double calculate_equivalent_resistance(double R1, double R2, int type)  {
    switch(type) {
        case 1: 
    
            return R1 + R2;
        case 2: 
        return (R1 * R2) / (R1 + R2);
         default: return -1.0; 
            }
        }
    double calculate_current(double V, double Req) {
        return V / Req;
    }
    const char* get_status(double I) {
        if (I <= 0.5) {
            return "SAFE";
        } else if (I > 0.5 && I <= 1.0) {
            return "WARNING";
        } else {
            return "DANGER";
        }

    
    }