package com.example.demo.dao;

import com.example.demo.bean.Person;

import java.util.List;

public interface PersonDao {

    int updatePerson(List<Person> personList);

    int insert(Person person);

    int batchInsert(List<Person> personList);
}
