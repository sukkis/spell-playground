class Game {

    private String name;
    private long experience;

    Game(String name, long experience) {
	this.name = name;
	this.experience = experience;
    }

    @Override
    public String toString(){
	return this.name + " " + this.experience;
    }
    
    public static void main(String[] args) {
	
    }
}
