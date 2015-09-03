class GameSave {

    protected saveToFile(String fileName, Game objectToSave) {
	FileOutputStream = saveFile = new FileOutputStream(fileName);
	ObjectOutputStream save = ObjectOutputStream(saveFile);
	save.writeObject(objectToSave);
	save.close();
    }
    
}
