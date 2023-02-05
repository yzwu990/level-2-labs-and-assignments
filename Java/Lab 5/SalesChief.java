
public class SalesChief extends SalesSupervisor {
	
	private String department;
	
	
	public SalesChief() {
		this.department = "No department";
	}
	
		
	public SalesChief(String department) {
		super();
		this.department = department;
		
	}
	
	public SalesChief(String name, int age,String location,String department) {
		super(name,age,location);
		this.department = department;
	}
		
	
	public String getDepartment() {
		return department;
	}




	public void setDepartment(String department) {
		this.department = department;
	}


	@Override
	public String toString() {
		return "Sales Chief [super = "+super.toString()+", department= "+getDepartment()+"]";
	}
	
	
	

}
