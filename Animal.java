class Animal{
	protected String name = "Null";
	protected int animType;
	protected String favFood;
	
	public Animal(String pName){
		initializeAnimal(pName);
	}
	
	protected void initializeAnimal(String pName){
		name = pName;
		animType = 1;
		favFood = "fish, meat, egg";
	}
	
	public String talk(){
		return "Miauw";
	}
	
	public String getName(){
		return name;
	}
	
	public String getFavFood(){
		return favFood;
	}
	
	public String getAnimType(){
		return "CAT";
	}
	
	public void displayAnimal(){
		System.out.println("----------------");
		System.out.println("Status Binatang : ");
		System.out.println(talk());
		System.out.println("Nama = " + getName());
		System.out.println("Jenis = " + getAnimType());
		System.out.println("Makanan = " + getFavFood());
	}
}