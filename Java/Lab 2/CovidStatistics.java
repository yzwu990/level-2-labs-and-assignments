

/**
* TASK: Remember to include all necessary headers for your Javadoc, descriptions and explanations of what you have done in the appropriate places.
* ENSURE that you add appropriate Javadoc style comments to relevant parts of this code as you update this program to show that you understand it.
*
* @author - various - put your own name here
* 
*/

public class CovidStatistics
{
public static void main(String[] args)
 {
   final int ROWS = 7;
   final int COLUMNS = 8;

   int[][] patients = 
      { 
         {  2200, 1100, 1200, 1000, 1015, 2000, 1092, 2204 },
         {  5020, 6105, 2009, 9047, 1016, 2014, 2708, 2308 }, 
         {  1720, 2406, 3054, 1018, 1023, 3100, 1406, 1502 }, 
         {  1490, 2002, 2016, 5008, 2044, 1055, 1607, 2201 },
         {  1520, 1007, 1092, 2065, 1023, 1010, 1046, 1502 },
         {  1670, 1201, 2008, 2001, 1086, 1009, 1041, 1706 },
	     {  1870, 2001, 2078, 1006, 1053, 1702, 1009, 1406 }
         
      };

   String[] provinces = 
      { 
         "Ontario", 
         "Quebec", 
         "Nova Scotia",
         "New Brunswick", 
         "Manitoba", 
         "British Columbia",
	     "Prince Edward Island"         
      };
   
   System.out.println("              Month      Feb    March    April   May   June   July    Aug     Sept");
   System.out.println();

   /** TASK: It is important to know the number of spice traders per city. So you need to print out the number of traders for all cities (content of the array) for each month.
   * Update the code in this section by using a nested for loop. 
   * 
   */
   
   // TO DO: WRITE YOUR CODE FOR THIS SECTION HERE!!!! Check the sample output file (SpiceOutput) to see the expected pattern to print out these details using printf.
    
   

   /** TASK: Update the code in this section by writing a nested for loop (for the columns and rows of the array) to compute the sum (column). 
   * Print the column sum using printf. Check the sample output file (SpiceOutput) to see the expected pattern.
   */ 
   
   System.out.println();
   System.out.print("             Recovered Patients");

   // TO DO: INSERT CODE HERE FOR THIS SECTION!!! Check the sample output file (SpiceOutput) to see the expected pattern.

   
   System.out.println(); 
   System.out.println(); 
   System.out.println("               Vaccinate and maintain good health practices!" );
}
}




   
   
   
   
   





