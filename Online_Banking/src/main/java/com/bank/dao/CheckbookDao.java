package com.bank.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bank.model.Checkbook;

@Repository
public interface CheckbookDao extends JpaRepository<Checkbook, Integer> {

	Checkbook findByCustomerId(int customerId);
	
}
