package com.mc.mybook.exception;

public class ErrorResponse {
	private int status;
	private String name;
	private String errorMessage;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	@Override
	public String toString() {
		return "ErrorResponse [status=" + status + ", name=" + name + ", errorMessage=" + errorMessage + "]";
	}
}
