package com.sukkeli.tutorial;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;


public class MyLibraryTest {

	private Book b1;
	private Book b2;
	private Person p1;
	private Person p2;
	private MyLibrary ml;

	@Test
	public void testMyLibrary() {
		MyLibrary ml = new MyLibrary("Test");
		
		assertEquals("Test", ml.name);
		assertTrue(ml.books instanceof ArrayList);
		assertTrue(ml.people instanceof ArrayList);
	}

	public void setup() {
		b1 = new Book("Book1");
		b2 = new Book("Book2");
		
		p1 = new Person();
		p2 = new Person();
		p1.setName("Fred");
		p2.setName("Sue");
		
		ml = new MyLibrary("Test");
	}
	
	public void testAddBook() {
		// create test objects
		setup();
		// test initial size is 0
		assertEquals(0, ml.getBooks().size());
		
		ml.addBook(b1);
		ml.addBook(b2);
		assertEquals(2, ml.getBooks().size());
		assertEquals(0, ml.getBooks().indexOf(b1));
		assertEquals(1, ml.getBooks().indexOf(b2));

		ml.removeBook(b1);
		assertEquals(1, ml.getBooks().size());
		assertEquals(0, ml.getBooks().indexOf(b2));
		
		ml.removeBook(b2);
		assertEquals(0, ml.getBooks().size());
		
	}
	
	public void testAddPerson() {
		setup();
		
		ml.addPerson(p1);
		ml.addPerson(p2);
		assertEquals(2, ml.getPeople().size());
		assertEquals(0, ml.getPeople().indexOf(p1));
		assertEquals(0, ml.getPeople().indexOf(p2));
	}
	
	public void testRemovePerson() {
		setup();
		ml.addPerson(p1);
		ml.addPerson(p2);
		ml.removePerson(p1);
		assertEquals(1, ml.getPeople().size());
		assertEquals(0, ml.getPeople().indexOf(p2));
		ml.removePerson(p2);
		assertEquals(0, ml.getPeople().size());
	}
	
	public void testCheckOut() {	
		setup();
		
		ml.addBook(b1);
		ml.addBook(b2);
		ml.addPerson(p1);
		ml.addPerson(p2);

		assertEquals("Book did not check out correctly", ml.checkOut(b1,p1));
			ml.checkOut(b1,p1);
		assertEquals("Fred", b1.getPerson().getName());
		
		assertFalse("Book was already checked out", ml.checkOut(b1,p2));
		
		assertTrue("Book check in failed", ml.checkIn(b1));
		
		assertFalse("Book was already checked in", ml.checkIn(b1));
		
		assertFalse("Book was never checked out", ml.checkIn(b2));
		
	}	

	
}
