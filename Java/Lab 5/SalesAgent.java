
public class SalesAgent {

	private String name;
	private int age;

	/**
	 * In this portion of your code, construct a SalesAgent object.
	 * 
	 * @param n the name of the Sales Agent
	 * @param a the age of the Sales Agent
	 */
	// START CODE
	
	
	public SalesAgent() {
		this.name = "No name";
		this.age = 0;
	}
	
	
	public SalesAgent(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	
	// END CODE

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * This portion of your code returns the string representation of the object.
	 * 
	 * @return a string representation of the object
	 */

	public String toString() {
		return "Sales Agent [name = " + getName() + ", age= " + age + "]";
	}

}
