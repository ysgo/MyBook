package model;

public class InterestBookList {
	private int id;
    private String email;
    private String title;
    private String author;
    private String publisher;
    private String description;
    private String image;
    private String logregistdate;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLogregistdate() {
		return logregistdate;
	}
	public void setLogregistdate(String logregistdate) {
		this.logregistdate = logregistdate;
	}
	@Override
	public String toString() {
		return "InterestBookList [id=" + id + ", email=" + email + ", title=" + title + ", author=" + author
				+ ", publisher=" + publisher + ", description=" + description + ", image=" + image + ", logregistdate="
				+ logregistdate + "]";
	}
}