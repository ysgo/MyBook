package com.mc.mybook.service.naver;
//
//import java.io.InputStreamReader;
//import java.net.URL;
//import java.net.URLConnection;
//import java.net.URLEncoder;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.xmlpull.v1.XmlPullParser;
//import org.xmlpull.v1.XmlPullParserFactory;
//
//import mybook.my.book.vo.Book;
//import mybook.my.book.vo.InterestBookList;
//import mybook.my.book.vo.Log;
//import mybook.my.book.vo.MyBookList;
//
//@Repository
//public class NaverBookDAO {
//	@Autowired
//	SqlSession session=null;
//	
//	private static String clientID = "개인 등록";
//	private static String clientSecret="개인 등록";
//	
//	public List<Book> searchBook(String keyword, int display, int start) {
//		List<Book> list = null;
//		try {
//			URL url;
//			url = new URL("https://openapi.naver.com/v1/search/book.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
//			+ (display !=0 ? "&display=" + display :"")
//			+ (start !=0 ? "&start=" + start :""));
//			
//			URLConnection urlConn = url.openConnection();
//			urlConn.setRequestProperty("X-naver-Client-Id", clientID);
//			urlConn.setRequestProperty("X-naver-Client-Secret", clientSecret);
//			
//			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
//			XmlPullParser parser = factory.newPullParser();
//			parser.setInput(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));
//		
//			int eventType = parser.getEventType();
//			Book b = null;
//			while(eventType != XmlPullParser.END_DOCUMENT) {
//				switch(eventType) {
//				case XmlPullParser.END_DOCUMENT:
//					break;
//				case XmlPullParser.START_DOCUMENT:
//					list = new ArrayList<Book>(); 
//					break;
//				case XmlPullParser.END_TAG: {
//					String tag = parser.getName();
//					if(tag.equals("item")) {
//						list.add(b);
//						b = null;
//					}
//				}
//				case XmlPullParser.START_TAG: {
//					String tag = parser.getName();
//					switch (tag) {
//                    case "item": 
//                        b = new Book();
//                        break;
//                    case "title":
//                        if(b != null)
//                            b.setTitle(parser.nextText());
//                        break;
//                    case "link":
//                        if(b != null)
//                            b.setLink(parser.nextText());
//                        break;
//                    case "image":
//                        if(b != null)
//                            b.setImage(parser.nextText().replace("type=m1", ""));
//                        break;
//                    case "author":
//                        if(b != null)
//                            b.setAuthor(parser.nextText());
//                        break;
//                    case "price":
//                        if(b != null)
//                            b.setPrice(parser.nextText());
//                        break;
//                    case "discount":
//                        if(b != null)
//                            b.setDiscount(parser.nextText());
//                        break;
//                    case "publisher":
//                        if(b != null)
//                            b.setPublisher(parser.nextText());
//                        break;
//                    case "pubdate":
//                        if(b != null)
//                            b.setPubdate(parser.nextText());
//                        break;
//                    case "isbn":
//                        if(b != null)
//                            b.setIsbn(parser.nextText());
//                        break;
//                    case "description":
//                        if(b != null)
//                            b.setDescription(parser.nextText());
//                        break;
//                    }
//				}
//				}
//				eventType = parser.next();
//			}
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//	
//
//	//myBookList
//	public List<MyBookList> listAll(MyBookList model){
//		List<MyBookList> list = null;
//		String statement = "mybook.my.book.dao.NaverBookDAO.selectAllBookList";
//		list = session.selectList(statement, model);
//		return list;
//	}
//	
//	public boolean insert(MyBookList vo) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.insertBookList";
//		if(session.insert(statement, vo) != 1)
//			result = false;
//		return result;
//	}
//	
//	public boolean delete(int id) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.deleteBookList";
//		if(session.delete(statement, id) != 1)
//			result = false;
//		return result;
//	}
//	
//	public boolean deleteAll(String email) {
//		String statement = "mybook.my.book.dao.NaverBookDAO.deleteAll";
//		if(session.delete(statement, email) != 1)
//			return false;
//		return true;
//	}
//	
//	public boolean update(MyBookList vo) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.updateBookList";
//		if(session.update(statement, vo) != 1)
//			result = false;
//		return result;
//	}
//
//	public List<MyBookList> searchReadbook(Map<String, String>map) {
//		List<MyBookList> list = null;
//		String statement = "mybook.my.book.dao.NaverBookDAO.searchBookList";
//		list = session.selectList(statement, map);
//		return list;
//	}
//	
//	public List<MyBookList> trendingbook() {
//		List<MyBookList> list = null;
//		String statement = "mybook.my.book.dao.NaverBookDAO.trendingbook";
//		list = session.selectList(statement);
//		return list;
//	}
//	
//	//select last registdate
//	public String selectMyBookLastRegistDate(){
//		String statement = "mybook.my.book.dao.NaverBookDAO.selectMyBookLastRegistDate";
//		String result = session.selectOne(statement);
//		return result;
//	}
//	
//	public String selectInterestLastRegistDate(){
//		String statement = "mybook.my.book.dao.NaverBookDAO.selectInterestLastRegistDate";
//		String result = session.selectOne(statement);
//		return result;
//	}
//	
//	//log
//	public List<Log> selectLog(){
//		List<Log> list = null;
//		String statement = "mybook.my.book.dao.NaverBookDAO.selectLog";
//		list = session.selectList(statement);
//		return list;
//	}
//	// 전체 로그 
//	public List<Log> selectTotalLog(Log log){
//		List<Log> list = null;
//		String statement = "mybook.my.book.dao.NaverBookDAO.selectTotalLog";
//		list = session.selectList(statement, log);
//		return list;
//	}
//	
//	public boolean insertLog(Log vo) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.insertLog";
//		if(session.insert(statement, vo) != 1)
//			result = false;
//		return result;
//	}
//	
//	public boolean updateLog(Log vo) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.updateLog";
//		if(session.update(statement, vo) != 1)
//			result = false;
//		return result;
//	}
//	
//	public boolean deleteLog(int id) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.deleteLog";
//		if(session.delete(statement, id) != 1)
//			result = false;
//		return result;
//	}
//	
//	//InterestBookList
//		public List<InterestBookList> listAllInterestBook(String id){
//			List<InterestBookList> list = null;
//			String statement = "mybook.my.book.dao.NaverBookDAO.selectAllInterestBookList";
//			list = session.selectList(statement, id);
//			return list;
//		}
//		
//		public boolean insertInterestBook(InterestBookList vo) {
//			boolean result=true;
//			String statement = "mybook.my.book.dao.NaverBookDAO.insertInterestBookList";
//			if(session.insert(statement, vo) != 1)
//				result = false;
//			return result;
//		}
//		
//		public boolean deleteInterestBook(int id) {
//			boolean result=true;
//			String statement = "mybook.my.book.dao.NaverBookDAO.deleteInterestBookList";
//			if(session.delete(statement, id) != 1)
//				result = false;
//			return result;
//		}
//		
//		public boolean deleteAllInterestBook(String email) {
//			String statement = "mybook.my.book.dao.NaverBookDAO.deleteAllInterestBook";
//			if(session.delete(statement, email) != 1)
//				return false;
//			return true;
//		}
//		
//		public List<InterestBookList> searchInterestbook(Map<String, String>map) {
//			List<InterestBookList> list = null;
//			String statement = "mybook.my.book.dao.NaverBookDAO.searchInterestbook";
//			list = session.selectList(statement, map);
//			return list;
//		}
//		
//		public int countInterestBook(String userId) {
//			String statement = "mybook.my.book.dao.NaverBookDAO.countInterestBookList";
//			int total = session.selectOne(statement, userId);
//			return total;
//		}
//		
//	//detailInterestBook
//		public List<InterestBookList> selectDetailInterestBook(int id){
//			List<InterestBookList> list = null;
//			String statement = "mybook.my.book.dao.NaverBookDAO.selectDetailInterestBook";
//			list = session.selectList(statement, id);
//			return list;
//		}
//
//	public int getTotalCnt(String userId) {
//		String statement = "mybook.my.book.dao.NaverBookDAO.totalCnt";
//		return session.selectOne(statement, userId);
//	}
//	
//	public int getTotalCntLog() {
//		String statement = "mybook.my.book.dao.NaverBookDAO.totalCntLog";
//		return session.selectOne(statement);
//	}
//	
//	public boolean updateUserName(Log log) {
//		boolean result=true;
//		String statement = "mybook.my.book.dao.NaverBookDAO.updateUserName";
//		if(session.delete(statement,log) != 1)
//			result = false;
//		return result;
//	}
//}
//
