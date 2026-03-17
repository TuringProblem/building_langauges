import java.util.Scanner;

public class Example {

  public static void main(String[] args) {
    String input = getInput();

    parseSource(input);
  }

  public static String getInput() throws IllegalArgumentException {
    Scanner scanner = new Scanner(System.in);
    try {
      return scanner.nextLine();
    } catch (IllegalArgumentException e) {
      return "";
    } finally {
      scanner.close();
    }
  }

  /**
   * read the input and extract into an expression tree
   *
   * What is an Expression?
   *
   * <E> = <E> + <T> | <T>
   * <T> = <T> * <F> | <F>
   * <F> = (<E>) | <N>
   * <N> = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
   *
   **/
  public static void parseSource(String input) {
    if (input.isEmpty()) {
      System.out.println("Invalid input");
      return;
    }
  }

}
