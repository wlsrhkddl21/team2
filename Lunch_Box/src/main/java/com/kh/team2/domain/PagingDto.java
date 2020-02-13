package com.kh.team2.domain;

public class PagingDto {
	
	private static final int PAGE_BLOCK = 10;
	
	private int page = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int startPage = 1;
	private int endPage = 10;
	private int totalCount;
	private boolean hasPrev = true;
	private boolean hasNext = true;
	private int perPage = 10;
	private int totalPage;
	private String searchType;
	private String keyword;
	
	
	public PagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	
		startRow = page * perPage - (perPage - 1);
		endRow = page * perPage;
		
		startPage = ((page - 1) / PAGE_BLOCK) * PAGE_BLOCK + 1;
		endPage = startPage + (PAGE_BLOCK - 1);
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int statrPage) {
		this.startPage = statrPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
//		totalPage = (int) Math.ceil((double) totalCount / 10);
		
		totalPage = (int) Math.ceil((double) totalCount / perPage);
		
		// 페이지 블럭 (51~60), 전체 페이지수는 51
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		if (startPage == 1) {
			hasPrev = false;
		}
		
		if (endPage == totalPage) {
			hasNext = false;
		}
	}
	
	public boolean isHasPrev() {
		return hasPrev;
	}
	public void setHasPrev(boolean hasPrev) {
		this.hasPrev = hasPrev;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
		setPage(page);
	}
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalCount=" + totalCount + ", hasPrev=" + hasPrev + ", hasNext="
				+ hasNext + ", perPage=" + perPage + ", totalPage=" + totalPage + ", searchType=" + searchType
				+ ", keyword=" + keyword + "]";
	}
	
		
}
