<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="w3-content w3-container w3-margin-top">
	<div class="w3-container w3-card-4">
		<form action="/users/searchId" method="POST">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div>
				<p>
					<label>UserName</label> <input class="w3-input" type="text"	id="userName" name="userName" required>
				</p>
				<p class="w3-center">
					<button type="submit" id=findBtn
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
				</p>
			</div>
		</form>
	</div>
	<div class="w3-container w3-card-4">
		<form action="$/users/searchPass" method="POST">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>UserName</label> <input class="w3-input" type="text"	id="userName" name="userName" required>
				</p>
				<p>
					<label>Email</label> <input class="w3-input" type="email"	id="userId" name="userId" required>
				</p>
				<p class="w3-center">
					<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
				</p>
			</div>
		</form>
	</div>
	<button type="button" onclick="window.close()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
</div>