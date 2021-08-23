import java.util.ArrayList;

class aniMain{
	public static void main(String[] args){
		ArrayList<Animal> animArray = new ArrayList<Animal>();
		
		animArray.add(new Animal("Tom"));
		animArray.add(new Animal("Hello Kitty"));
		animArray.add(new Animal("Doraemon"));
		animArray.add(new Mouse("Jerry"));
		animArray.add(new Mouse("Micky"));
		
		for (Animal a: animArray){
			a.displayAnimal();
		}
	}
}