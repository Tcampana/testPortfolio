import java.util.Scanner;

public class MakeOrbit{
  public static void main (String[] args){
    Scanner keyboard = new Scanner(System.in);
    Planet myPlanet = new Planet();
    Satellite mySat = new Satellite();
    Sun mySun = new Sun();
    
    //Sun Gravity
    System.out.println("Your Suns Gravity is currently: " + mySun.getGravity() + ".");
    System.out.println("What do you want your Suns Gravity to be?");
    mySun.setGravity(keyboard.nextInt());
    System.out.println("Your Suns Gravity is now: " + mySun.getGravity() + ".");
    System.out.println(" ");
    System.out.println("****PLANET****");
    
    //Planet Gravity and Momentum
    System.out.println("Your Planets Gravity is currently: " + myPlanet.getGravity() + ".");
    System.out.println("Your Planets Momentum is currently: " + myPlanet.getMomentum() + ".");
    System.out.println("What do you want your Planets Gravity to be?");
    myPlanet.setGravity(keyboard.nextInt());
    System.out.println("Your Planets Gravity is now: " + myPlanet.getGravity() + ".");
    System.out.println("What do you want your Planets Momentum to be?");
    myPlanet.setMomentum(keyboard.nextInt());
    System.out.println("Your Planet now goes into orbit with " + myPlanet.getGravity() + " Gravity, and " + myPlanet.getMomentum() + " Momentum.");
    System.out.println(" ");
    System.out.println("****Satelltie****");
    
    //Satellite Momentum
    System.out.println("Your Satellites Momentum is currently " + mySat.getMomentum() + ".");
    System.out.println("What do you want your Satellites Momentum to be?");
    mySat.setMomentum(keyboard.nextInt());
    System.out.println("Your Satellites Momentum is now: " + mySat.getMomentum() + ".");
    System.out.println(" ");
    
    System.out.println("You now have a Satellite with " + mySat.getMomentum() + " Momentum,");
    System.out.println("orbiting around a Planet with " + myPlanet.getGravity() + " Gravity and " + myPlanet.getMomentum() + " Momentum,");
    System.out.println("going around a sun with " + mySun.getGravity() + " Gravity.");
  }
}