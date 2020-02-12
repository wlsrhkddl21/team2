package com.kh.team2.persistence;

public interface ProductDao {
	public void insertPDT() throws Exception;
	public void deletePDT() throws Exception;
	public void updatePDT() throws Exception;
	public void readPDT() throws Exception;
	public void readAllPDT() throws Exception;
}
