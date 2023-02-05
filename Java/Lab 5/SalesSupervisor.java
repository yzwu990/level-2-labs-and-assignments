
public class SalesSupervisor extends SalesAgent {

	private String location;

	
	public SalesSupervisor() {
		this.location = "No location";
	}
	
	public SalesSupervisor(String location) {
		super();
		this.location = location;
	}
	
	
	public SalesSupervisor(String name, int age,String location) {
		super(name,age);
		this.location = location;
	}
	
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Sales Supervisor [super = "+super.toString()+", location= "
				+ getLocation() + "]";

	}

}
