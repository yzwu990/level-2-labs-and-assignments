package fall22lab3;

/**
 * This program depicts Overloaded constructor calls.
 * It shows the chaining of overloaded constructors using "this" keyword.
 * This lab has been completed for demo by: PUT YOUR NAME HERE. 
 */


/**
 * This class is named EventSchedule Class. It shows constructor chaining using keyword "this".
 * In this code, the simpler constructors all call the more complex one, thereby
 * chaining the calls 'UPWARDS' (from the default constructor to the one 
 * with the most arguments. Ensure that you implement it in this order). 
 
 * EventSchedule() calls EventSchedule(int, int, int), program flow returns to
 * EventSchedule() and exits the constructor.
 * 
 * EventSchedule(int) calls EventSchedule(int, int, int), program flow returns
 * to EventSchedule(int) and exits the constructor.
 * 
 * EventSchedule(int, int) calls EventSchedule(int, int, int), program flow
 * returns to EventSchedule(int, int) and exits the constructor.
 * 
 * EventSchedule(int, int, int) just assigns the values.
 * 
 * NOTE: The constructors in this code have System.out.println(a-message) in them,
 *       for demonstration purposes only. DO NOT PUT input / output
 *       into constructors in real production code!!!
 * 
 * @see  
 * @author PUT YOUR NAME HERE
 */
public class EventSchedule {

	/**
	 * year component of the date of EventSchedule.
	 */
	private int year;
	
	/**
	 * month component of the date of
	 */
	private int month;
	
	/**
	 * day component of the date of
	 */
	private int day;
	
	/**
	 * The default constructor sets year, month, day to the current date.
	 */
	public EventSchedule() {
		//TO DO: write the proper constructor call and pass  parameters here
		this(int year, int month, int day);


		System.out.println("EventSchedule() was called");
	}
	
	/**
	 * TO DO: YOUR TASK 1: IMPLEMENT THIS PORTION OF THE CODE.
	 * This constructor sets the year as passed, month to current month,
	 * and day to current day.
	 * @param year The year of this EventSchedule.
	 */
	
	/** START CODE HERE */
	
	public EventSchedule(int year) {
		//code rest of constructor here
	}
	
	/** CODE ENDS HERE */
	
	/**
	 * TO DO: YOUR TASK 2: IMPLEMENT THIS PORTION OF THE CODE.
	 * 
	 * This constructor sets the year as passed, month as passed,
	 * and day to current day.
	 * @param year The year of this EventSchedule.
	 * @param month of this EventSchedule.
	 */
	
	/** CODE STARTS HERE */
	
	
	/** CODE ENDS HERE */
	

	/**
	 * TO DO: YOUR TASK 3: IMPLEMENT THIS PORTION OF THE CODE.
	 * 
	 * This constructor sets the year as passed, month as passed, and
	 * day as passed.
	 * @param year The year of this EventSchedule.
	 * @param month of this EventSchedule.
	 * @param day of this EventSchedule.
	 */
	
	/** CODE STARTS HERE */
	
	public EventSchedule(int year, int month, int day) {
		System.out.println("EventSchedule(int,int,int) was called");
		this.year=year;
		this.month=month;
		this.day=day;
	}
	
	/** CODE ENDS HERE */
	
	/**
	 * Returns the year for this EventSchedule.
	 * @return the year for this EventSchedule.
	 */
	public int getyear() {
		return year;
	}
	/**
	 * Sets the year for this EventSchedule.
	 * @param year The year for this EventSchedule.
	 */
	public void setyear(int year) {
		this.year = year;
	}
	/**
	 * Returns true if this EventSchedule is hybrid, false if it is not.
	 * @return true if this EventSchedule is hybrid, false if it is not.
	 */
	public int getMonth() {
		return month;
	}
	/**
	 * TO DO: YOUR TASK 4: IMPLEMENT THIS PORTION OF THE CODE.
	 * 
	 * Sets the month state for this EventSchedule.
	 * @param month this is the month to set for EventSchedule.
	 */
	
	/** START CODE HERE */
	
	
	/** CODE ENDS HERE */
	
	/**
	 * day of this Orange in EventSchedule.
	 * @return day of this EventSchedule.
	 */
	public double getday() {
		return day;
	}
	/**
	 * Sets the day of this EventSchedule.
	 * @param day The day of this EventSchedule .
	 */
	public void setday(int day) {
		this.day = day;
	}
	
	/**
	 * @return A String representation of this EventSchedule, each field is separated 
	 * by a comma in the order of year, month, day
	 */
	public String createReport() {
		return String.format("EventSchedule, " + "year: %d, Month: %d, Day: %d%n",year,month,day);
	}
}
