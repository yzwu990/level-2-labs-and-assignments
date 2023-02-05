
public class Test {

	public static void main(String[] args) {


		SalesAgent sa1 = new SalesAgent("Peter",56);
		System.out.println(sa1.toString());
		
		SalesAgent sa2 = new SalesAgent("John",48);
		System.out.println(sa2.toString());
		
		
		SalesSupervisor ss = new SalesSupervisor("Ifeoma",53,"Toronto");
		System.out.println(ss.toString());
		

		SalesChief sc = new SalesChief("Yanzhang Wu",32,"Ottawa","Apparel");
		System.out.println(sc.toString());
		
		
		
		
		
		
	}
}