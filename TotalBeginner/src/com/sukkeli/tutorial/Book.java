package com.sukkeli.tutorial;

public class Book {

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	String title;
	String author;
	Person person;

	public Book(String string) {
		this.title = string;
		this.author = "unknown author";
	}

	public void setPerson(Person p2) {
		this.person = p2;
	}

	public Person getPerson() {
			
		return this.person;
	}

	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}

}
