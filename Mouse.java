class Mouse extends Animal{
	public Mouse(String pName){
		super(pName);
	}
	
	protected void initializeAnimal(String pName){
		name = pName;
		animType = 2;
		favFood = "Cheese";
	}
	
	public String talk(){
		return "Ciit Ciit";
	}
	
	public String getAnimType(){
		return "MOUSE";
	}
}