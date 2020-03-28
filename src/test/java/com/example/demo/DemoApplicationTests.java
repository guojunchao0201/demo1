package com.example.demo;

import com.example.demo.bean.Person;
import com.example.demo.dao.PersonDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class DemoApplicationTests {

	@Autowired
	PersonDao personDao;

	@Test
	void contextLoads() {
	}

	@Test
	public void testUpdate() {

		Person person = new Person();
		person.setAge(50);
		person.setName("a");
		person.setSex("男");

		Person person1 = new Person();
		person1.setName("b");
		person1.setAge(80);
		person1.setSex("女");
		List<Person> list = new ArrayList<>();
		list.add(person1);
		list.add(person);

		int i = personDao.batchInsert(list);
		// int i = personDao.insert(person);

		System.out.println(i);
	}

	@Test
	public void testInsert() {

		Person person = new Person();
		person.setName("c");
		person.setAge(100);
		person.setSex("男");

		int insert = personDao.insert(person);
		System.out.println(insert);
	}

}
