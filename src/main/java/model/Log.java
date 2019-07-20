package model;

public class Log { //l.userName, m.title, m.m_star, m.m_content, i.title, l.logregistdate
	private String userName;
	private String myBookTitle;
	private String mStar;
	private String mContent;
	private String interestBookTitle;
	private String logRegistDate;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMyBookTitle() {
		return myBookTitle;
	}
	public void setMyBookTitle(String myBookTitle) {
		this.myBookTitle = myBookTitle;
	}
	public String getmStar() {
		return mStar;
	}
	public void setmStar(String mStar) {
		this.mStar = mStar;
	}
	public String getmContent() {
		return mContent;
	}
	public void setmContent(String mContent) {
		this.mContent = mContent;
	}
	public String getInterestBookTitle() {
		return interestBookTitle;
	}
	public void setInterestBookTitle(String interestBookTitle) {
		this.interestBookTitle = interestBookTitle;
	}
	public String getLogRegistDate() {
		return logRegistDate;
	}
	public void setLogRegistDate(String logRegistDate) {
		this.logRegistDate = logRegistDate;
	}
	@Override
	public String toString() {
		return "Log [userName=" + userName + ", myBookTitle=" + myBookTitle + ", mStar=" + mStar + ", mContent="
				+ mContent + ", interestBookTitle=" + interestBookTitle + ", logRegistDate=" + logRegistDate + "]";
	}
}
