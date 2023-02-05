/**
 * This program prints the word "Hello!"
 * and then prints "pizza pizza".
 * 
 * <pre>Class: CST8284</pre>
 * <pre>Professor: Fedor Ilitchev</pre>
 * <pre>Sept 7, 2022</pre>
 * 
 * @author Fedor Ilitchev
 * @version 1.0
 * @since 1.8.0_342
 */
public class Example {

	/**
	 * This method prints the word "Hello!"
	 * and then prints pizza twice.
	 * 
	 * @param args arguments passed from command line
	 */
	public static void main(String[]args) {
		printHello();
		System.out.println(doubleWord("pizza "));
	}
	
	/**
	 * This method prints "Hello!"
	 */
	public static void printHello() {
		System.out.println("Hello!");
	}
	
	/**
	 * This method takes a word as input
	 * and returns a String of that word 
	 * concatenated to itself.
	 * 
	 * @param word the word that you wish to have concatenated to itself
	 * @return The word concatenated to itself
	 */
	public static String doubleWord(String word) {
		return word + word;
	}
}
