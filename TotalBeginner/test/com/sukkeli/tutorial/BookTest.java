package com.sukkeli.tutorial;

import static org.junit.Assert.*;

import org.junit.Test;

public class BookTest {

	@Test
	public void testBook() {
		Book b1 = new Book("Great Expectations");
		assertEquals("Great Expectations", b1.title);
		assertEquals("unknown author", b1.author);
		
	}

	public void testSetAuthor(){
		Book b2 = new Book("Life of Pi");
		b2.setAuthor("Yann Martel");
		String testAuthor = b2.getAuthor();
		assertEquals("Yann Martel", testAuthor);
	}

	public void testGetPerson(){
		Book b3 = new Book("War and Peace");
		Person p2 = new Person();
		p2.setName("Elvis");
		
		// method to say book is loaned to this person
		b3.setPerson(p2);
		
		// get the name of the person who has the book
		String testName = b3.getPerson().getName();
//		Person testPerson = b3.getPerson();
//		String testName = b3.getName();
		
		assertEquals("Elvis", testName);
		
	}
	
}

