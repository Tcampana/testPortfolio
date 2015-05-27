public class bottles{
  public static void main(String args[]) {
       int x = 99;
       int y = 98;
       
       while( x > 1 ) {
         System.out.print(x + " bottles of sauce on the wall, " + x + " bottles of sauce. Take one down, pass it around, " + y + " bottles of sauce on the wall");
         x--;
         y--;
         System.out.print("\n");
       }
       if ( x < 2) {
         System.out.print(x + " bottle of sauce on the wall, " + x + " bottle of sauce. Take it down, pass it around, no more bottles of sauce on the wall!");
       }
  }
}
 
