
// THIS IS A CODE FILE FOR LAB 6. THIS CODE FILE REQUIRES SOME MODIFICATIONS!!!


//BasePlusCommissionProgrammer.java
//BasePlusCommissionProgrammer class extends CommissionProgrammer.

public class BasePlusCommissionProgrammer extends CommissionProgrammer { 

private double baseSalary; // base salary per week

//constructor
public BasePlusCommissionProgrammer(String firstName, String lastName, 
String socialSecurityNumber, int month, int year, 
double grossSales, double commissionRate, double baseSalary) {
super(firstName, lastName, socialSecurityNumber, 
  month, year, grossSales, commissionRate);

if (baseSalary < 0.0) { // validate baseSalary                  
  throw new IllegalArgumentException("Base salary must be >= 0.0");
}

this.baseSalary = baseSalary;                
}

//set base salary
public void setBaseSalary(double baseSalary) {
if (baseSalary < 0.0) { // validate baseSalary                  
  throw new IllegalArgumentException("Base salary must be >= 0.0");
}

this.baseSalary = baseSalary;                
} 

//return base salary
public double getBaseSalary() {
return baseSalary;
}

//calculate earnings; override method earnings in CommissionProgrammer

//MODIFY THIS PORTION. WHY WILL THIS PORTION OF YOUR CODE REQUIRE MODIFICATION?
//PROVIDE THE ANSWER TO THIS QUESTION TO YOUR PROFESSOR DURING DEMO

@Override                                                            
public double earnings() {                                             
return getBaseSalary() + super.earnings();                        
} 

//return String representation of BasePlusCommissionProgrammer object
@Override     
                                                      
//TO DO: COMEPLETE THIS PORTION. Format your solution according to sample output.     
//START     
// INSERT YOUR CODE
//END


}



