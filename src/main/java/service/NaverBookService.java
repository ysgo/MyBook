package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NaverBookDAO;
import vo.Book;
import vo.InterestBookList;
import vo.Log;
import vo.MyBookList;

@Service
public class NaverBookService {
	@Autowired
	private NaverBookDAO dao;
	
	// 책 검색
	public List<Book> searchBook(String keyword, int display, int start) {
		return dao.searchBook(keyword, display, start);
	}
	
	// 등록된 리뷰 모두 출력 
	public List<MyBookList> listAll(MyBookList model){
		return dao.listAll(model);
	}
	
	// 리뷰 등록 
	public boolean insert(MyBookList vo) {
		return dao.insert(vo);
	}
	
	// 리뷰 삭제 
	public boolean delete(int id) {
		return dao.delete(id);
	}
	
	// 리뷰 모두 삭제(탈퇴시)
	public boolean deleteAll(String email) {
		return dao.deleteAll(email);
	}
	
	// 리뷰 수정 
	public boolean update(MyBookList vo) {
		return dao.update(vo);
	}

	// 등록된 리뷰 검색 
	public List<MyBookList> searchReadbook(Map<String, String>map) {
		return dao.searchReadbook(map);
	}
	
	// 트렌드책 리스트 받아오기 
	public List<MyBookList> trendingbook() {
		return dao.trendingbook();
	}
	
	// 최신등록리뷰 출력 
	public String selectMyBookLastRegistDate(){
		return dao.selectMyBookLastRegistDate();
	}
	
	// 최신등록관심책 출력 
	public String selectInterestLastRegistDate(){
		return dao.selectInterestLastRegistDate();
	}
	
	// 로그 출력 
	public List<Log> selectLog(){
		return dao.selectLog();
	}
	// 로그 출력 
	public List<Log> selectTotalLog(Log log){
		return dao.selectTotalLog(log);
	}
	
	// 로그 추가 
	public boolean insertLog(Log vo) {
		return dao.insertLog(vo);
	}
	
	// 로그 수정 
	public boolean updateLog(Log vo) {
		return dao.updateLog(vo);
	}
	
	// 로그 삭제 
	public boolean deleteLog(int id) {
		return dao.deleteLog(id);
	}
	
	// 관심있는책 모두 출력 
	public List<InterestBookList> listAllInterestBook(String id){
		return dao.listAllInterestBook(id);
	}
	
	// 관심있는책 추가 
	public boolean insertInterestBook(InterestBookList vo) {
		return dao.insertInterestBook(vo);
	}
		
	// 관심있는책 삭제 
	public boolean deleteInterestBook(int id) {
		return dao.deleteInterestBook(id);
	}
		
	// 관심있는책 모두 삭제(탈퇴시) 
	public boolean deleteAllInterestBook(String email) {
		return dao.deleteAllInterestBook(email);
	}
		
	// 등록된 관심있는책 검색 
	public List<InterestBookList> searchInterestbook(Map<String, String>map) {
		return dao.searchInterestbook(map);
	}
		
	// 관심있는책 수 출력 
	public int countInterestBook(String userId) {
		return dao.countInterestBook(userId);
	}
		
	// 관심있는 책 세부정보 출력 
	public List<InterestBookList> selectDetailInterestBook(int id){
		return dao.selectDetailInterestBook(id);
	}

	// 등록된 리뷰 총 개수 출력 
	public int getTotalCnt(String userId) {
		return dao.getTotalCnt(userId);
	}
	
	// 등록된 로그 총 개수 출력 
	public int getTotalCntLog() {
		return dao.getTotalCntLog();
	}
	
	public boolean updateUserName(Log log) {
		return dao.updateUserName(log);
	}
}