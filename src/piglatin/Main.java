import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    System.out.println("Enter your first or last name: ");
    String name = scan.nextLine();
    name = name.toLowerCase();
    String firstLetter = name.substring(0,1);
    String lastPart = name.substring(1);
    String result = lastPart + firstLetter + "ay";
    System.out.println(result);
    scan.close();
  }
}